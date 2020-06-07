# == Schema Information
#
# Table name: chat_rooms
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatRoom < ApplicationRecord
  has_many :chat_room_users, dependent: :destroy
  has_many :users, through: :chat_room_users
  has_many :messages, dependent: :destroy

  def self.chat_room_for_users(users)
    user_ids = users.map(&:id).sort
    name = user_ids.join(':').to_s

    unless chat_room = find_by(name: name)
      chat_room = new(name: name)
      chat_room.users = users
      chat_room.save
    end
    chat_room
  end

  def users_excluding(user)
    users.reject { |u| u == user }
  end
end
