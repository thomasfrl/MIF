class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :pictures
  validates :room, inclusion: { in: ["Bed-room", "Living-room"], message: "%{value} is not a valid room"}
  validates :sleep, inclusion: { in: ["Couch", "Bed"], message: "%{value} is not a valid sleep"}
  validates :place, numericality: { greater_than: 0, less_than: 4 }
end
