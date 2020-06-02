class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
    print("ENTROOOO")
    @event = Event.new
    offset = rand(User.count)
    @invite_users = User.offset(offset).take(5)
    print("HOLAAAAAAAAAAAAAAAAAAAAAAAAAAa", @invite_users)
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
                       event_organizer: EventOrganizer.find(1))

    respond_to do |format|
      if @event.save
        @event.event_page.event_banner_picture.attach(params[:event_banner_picture])
        @event.event_page.save
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
    respond_to do |format|
      if @event.update(event_params)
        if params[:is_public] == "not public"
          @event.is_public = false
          @event.save!
        elsif params[:is_public] == "public"
          @event.is_public = true
          @event.save!
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
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
                                      :description, :is_public, :event_organizer_id, :event_banner_picture,
                                      poll_attributes: [:name, :possibleDates, :minimumAnswers])
    end
end
