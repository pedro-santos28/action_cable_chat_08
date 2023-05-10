class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  after_save :broadcast

  private

    def broadcast
      ActionCable.server.broadcast(
        "chat_channel",
        { sender: user.email, body: body }
      )
    end
end
