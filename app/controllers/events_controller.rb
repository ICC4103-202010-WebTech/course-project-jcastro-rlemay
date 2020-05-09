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
    if params[:public]
      @visibility = "Public"
    else
      @visibility = "Private"
    end
    if params[:start_date] == nil
      @date = "Poll"
    else
      @date = params[:start_date]
    end

    if params[:end_date] == nil
      @end_date = "Poll"
    else
      @end_date = params[:end_date]
    end

    @invited = Invitation.where(event_id: params[:id])

    eventPageid = EventPage.where(event_id: params[:id])[0].id
    @comments = Comment.where(event_page_id: eventPageid)
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
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
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
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:id, :name, :start_date, :end_date, :location,
                                      :description, :public, :event_organizer_id)
    end
end
