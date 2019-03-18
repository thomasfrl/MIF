class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver}

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy
  has_many :answers, dependent: :destroy

  def last_message
    messages = self.messages
    messages.to_a.sort!{|a,b| a.created_at <=> b.created_at}.last
  end

  def last_update
    messages = self.messages
    if messages.empty?
      self.created_at
    else 
      messages.to_a.sort!{|a,b| a.created_at <=> b.created_at}.last.created_at
    end
  end


  def self.sort_by_last_message
    convs = self.all  #.select{|c| !c.messages.empty?}
    convs.sort{|a,b| b.last_update <=> a.last_update}
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
