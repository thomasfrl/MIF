class Flat < ApplicationRecord
  before_validation :default_values
  belongs_to :user
  has_many_attached :pictures
  validates :room, inclusion: { in: ["Bed-room", "Living-room", ""], message: "%{value} is not a valid room"}
  validates :sleep, inclusion: { in: ["Couch", "Bed",""], message: "%{value} is not a valid sleep"}
  validates :place, numericality: { greater_than: 0, less_than: 4 }
  def default_values
    self.room ||= ''
    self.sleep ||= ''
    self.place ||= 1
  end 
end
