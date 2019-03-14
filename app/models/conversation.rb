class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver}

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  def last_update
    messages = self.messages
    messages.to_a.sort!{|a,b| a.created_at <=> b.created_at}.last
  end

  def self.sort_by_last_message
    self.all.sort{|a,b| b.last_update.created_at <=> a.last_update.created_at}
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
