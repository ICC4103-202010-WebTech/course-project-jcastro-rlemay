class MessageController < ApplicationController
  load_and_authorize_resource
  # POST /comments
  # POST /comments.json
  def create

    @message = Message.new(message: params[:message], from_id: current_user.id, to_id: params[:to_id])
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message.to, notice: 'Message was successfully sent.' }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.fetch(:message, {}).permit(:id, :message, :to_id)
  end
end
