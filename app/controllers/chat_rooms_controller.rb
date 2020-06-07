class ChatRoomsController < ApplicationController
  before_action :require_login, only: %i[index show]
  before_action :require_user_ids, only: %i[create]

  def index
    @chat_rooms = current_user.chat_rooms.includes(:users, :messages).page(params[:page]).order(created_at: :desc)
  end

  def create
    users = User.where(id: params.dig(:chat_room, :user_ids)) + [current_user]
    @chat_room = ChatRoom.chat_room_for_users(users)
    redirect_to chat_room_path(@chat_room)
  end

  def show
    @chat_room = current_user.chat_rooms.includes(:users).find(params[:id])
    @messages = @chat_room.messages.includes(:user)
  end

  private

  def require_user_ids
    binding.pry
    redirect_back(fallback_location: root_path, danger: 'チャットの相手を選択してください') if params.dig(:chat_room, :user_ids).reject(&:blank?).blank?
  end
end
