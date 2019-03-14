class Correspondance < ApplicationRecord
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"
  has_many :trip
  validates :status, inclusion: { in: ["waiting", "validated", "refused"], message: "%{value} is not a valid status"}
  #validates :message, length: { in: 6..30 }
  def friends
    [self.user_one, self.user_two]
  end

  def self.already_contain?(correspondance)
    self.all.each do |c|
      if (c.user_one == correspondance.user_one && c.user_two == correspondance.user_two) || (c.user_one == correspondance.user_two && c.user_two == correspondance.user_one)
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
