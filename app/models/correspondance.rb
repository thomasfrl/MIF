class Correspondance < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :acceptor, class_name: "User"
  has_many :trips, dependent: :destroy
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

  def self.already_exist?(user1,user2)
    self.all.each do |c|
      if (c.creator == user1 && c.acceptor == user2) || (c.creator == user2 && c.acceptor == user1)
        return true
      end
    end
    return false
  end

  def self.select(user1, user2)
    if self.already_exist?(user1,user2)
      if self.where(creator: user1, acceptor: user2).empty?
        return self.where(creator: user2, acceptor: user1).first
      else
        return self.where(creator: user1, acceptor: user2).first
      end
    else
      return false
    end
  end

  def other_friend(current_user)
    f = self.friends
    f.delete(current_user)
    return f[0]
  end
end
