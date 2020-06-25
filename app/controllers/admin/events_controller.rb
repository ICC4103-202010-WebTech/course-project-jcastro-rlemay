class Admin::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :photos, :videos, :files, :invites]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if @event.is_public
      @visibility = "Public"
    else
      @visibility = "Private"
    end
    if @event.start_date == nil
      @date = "Poll"
    else
      @date = @event.start_date
    end

    if @event.end_date == nil
      @end_date = "Poll"
    else
      @end_date = @event.end_date
    end

    @invited = Invitation.where(event_id: params[:id])

    eventPageid = EventPage.where(event_id: params[:id])[0].id
    @comments = Comment.where(event_page_id: eventPageid)
    @comment_replies = CommentReply.all
  end

  # GET /events/new
  def new
    @event = Event.new
    offset = rand(User.count)
    @invite_users = User.offset(offset).take(5)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if params[:date] == "not poll"
      x = params[:start_date]
      x = x[:year] + "-" + x[:month] + "-" + x[:day]
      y = params[:end_date]
      y = y[:year] + "-" + y[:month] + "-" + y[:day]
    else
      x = nil
      y = nil

    end

    @event = Event.new(name: event_params[:name], start_date: x, end_date: y,
                       description: event_params[:description],
                       event_organizer: EventOrganizer.find(1), location: event_params[:location])
    respond_to do |format|
      if @event.save
        @event_page = @event.event_page
        if event_params[:event_banner_picture] != nil
          @event_page.event_banner_picture.attach(event_params[:event_banner_picture])
          @event_page.save
        end
        @event_page.minimumGuests = params[:event][:event_page_attributes][:minimumGuests]
        @event_page.maximumGuests = params[:event][:event_page_attributes][:maximumGuests]
        @event_page.save
        if x == nil
          @poll = Poll.new(
              name: params[:event][:poll_attributes][:name],
              possibleDates: params[:event][:poll_attributes][:possibleDates],
              minimumAnswers: params[:event][:poll_attributes][:minimumAnswers].to_i, event_id: @event.id)
          @poll.save!
        end
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        flash[:alert] = "Could not create event!"
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    print("ENTRO AL UPDATE", event_params[:photos])
    respond_to do |format|
      if @event.update(name: event_params[:name], location: event_params[:location],
                       description: event_params[:description])
        if event_params[:event_banner_picture] != nil
          @event_page.event_banner_picture.attach(event_params[:event_banner_picture])
          @event_page.save
        end
        if event_params[:photos] != nil
          @event_page.photos.attach(event_params[:photos])
          @event_page.save
        end
        if event_params[:videos] != nil
          @event_page.videos.attach(event_params[:videos])
          @event_page.save
        end
        if event_params[:files] != nil
          @event_page.files.attach(event_params[:files])
          @event_page.save
        end
        if params[:is_public] == "not public"
          @event.is_public = false
          @event.save!
        elsif params[:is_public] == "public"
          @event.is_public = true
          @event.save!
        end
        if event_params[:minimumGuests] != ""
          @event_page.minimumGuests = params[:event][:event_page_attributes][:minimumGuests]
          @event_page.save
        end
        if event_params[:maximumGuests] != ""
          @event_page.maximumGuests = params[:event][:event_page_attributes][:maximumGuests]
          @event_page.save
        end
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }

      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invites
    invited = Invitation.where(event_id: @event).pluck(:user_id)
    invited << @event.event_organizer_id
    @pagy, @invites = pagy(User.where.not(id: invited))
    if event_params[:invitation] != nil
      @invitation = Invitation.new(user_id: event_params[:invitation], event_id: @event.id, message: "You were invited to an event!")
      if @invitation.save
        redirect_to invites_admin_event_path, notice: @invitation.user.name+ " "+ @invitation.user.lastName + " was invited"
      else
      end
    end
  end

  def photos
    if params[:photos] != nil
      @event_page.photos.attach(params[:photos])
      @event_page.save
      redirect_to photos_event_path, notice: 'Uploaded photos to event.'
    end
  end

  def videos
    if params[:videos] != nil
      @event_page.videos.attach(params[:videos])
      @event_page.save
      redirect_to videos_event_path, notice: 'Uploaded videos to event.'
    end
  end

  def files
    if params[:files] != nil
      @event_page.files.attach(params[:files])
      @event_page.save
      redirect_to files_event_path, notice: 'Uploaded files to event.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @event_page = EventPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:id, :name, :start_date, :end_date, :location,
                                      :description, :is_public, :event_organizer_id,
                                      :event_banner_picture, :invitation,
                                      poll_attributes: [:name, :possibleDates, :minimumAnswers],
                                      videos:[], photos:[], files:[],
                                      event_page_attributes: [:minimumGuests, :maximumGuests])
    end
end

