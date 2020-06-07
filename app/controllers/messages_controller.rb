class MessagesController < ApplicationController
  before_action :require_login, only: %i[create]
  def create
    @message = current_user.messages.create(message_params)
  end

  def edit
    @message = current_user.messages.find(params[:id])
  end

  def update
    @message = current_user.messages.find(params[:id])
    @message.update(message_update_params)
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy!
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(chat_room_id: params[:chat_room_id])
  end

  def message_update_params
    params.require(:message).permit(:body)
  end
end
