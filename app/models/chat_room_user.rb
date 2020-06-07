# == Schema Information
#
# Table name: chat_room_users
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_chat_room_users_on_chat_room_id              (chat_room_id)
#  index_chat_room_users_on_user_id                   (user_id)
#  index_chat_room_users_on_user_id_and_chat_room_id  (user_id,chat_room_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (chat_room_id => chat_rooms.id)
#  fk_rails_...  (user_id => users.id)
#

class ChatRoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
end
