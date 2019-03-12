class Flat < ApplicationRecord
  belongs_to :user
  has_one_attached :main_picture
  has_many_attached :other_pictures
end
