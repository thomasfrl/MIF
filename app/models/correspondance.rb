class Correspondance < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :acceptor, class_name: "User"
  has_many :trip
  validates :status, inclusion: { in: ["waiting", "validated", "refused"], message: "%{value} is not a valid status"}
  #validates :message, length: { in: 6..30 }
  def friends
    [self.creator, self.acceptor]
  end

  def self.already_contain?(correspondance)
    self.all.each do |c|
      if (c.creator == correspondance.creator && c.acceptor == correspondance.acceptor) || (c.creator == correspondance.acceptor && c.acceptor == correspondance.creator)
        return true
      end
    end
    return false
  end

  def other_friend(current_user)
    f = self.friends
    f.delete(current_user)
    return f[0]
  end
end
