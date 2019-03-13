class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver}

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  def participants
    [self.author, self.receiver]
  end

  def other_participant(current_user)
     p = self.participants
     p.delete(current_user)
    return p[0]
  end
end
