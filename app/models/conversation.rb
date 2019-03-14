class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver}

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  def last_update
    messages = self.messages
    messages.to_a.sort!{|a,b| a.created_at <=> b.created_at}
  end

  def sort_by_last_message

  end

  def participants
    [self.author, self.receiver]
  end

  def other_participant(current_user)
     p = self.participants
     p.delete(current_user)
    return p[0]
  end
end
