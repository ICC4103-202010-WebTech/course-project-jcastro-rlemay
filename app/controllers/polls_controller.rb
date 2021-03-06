class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @dates = @poll.possibleDates.split(" ")
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update

      @vote = Vote.new(answerDate: params[:start_date], poll_id: @poll.id, user_id: current_user.id)
      if @vote.save
          redirect_to @poll.event, notice: 'Vote was created.'
      else
        flash[:alert] = "You already voted!"
        redirect_to @poll.event

      end
    end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.fetch(:poll, {}).permit(:id, :name, :possibleDates, :minimumAnswers,
                                     :currentAnswers ,:event_id)
    end
end
