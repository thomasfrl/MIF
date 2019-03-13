class City < ApplicationRecord
  has_one_attached :picture
  has_many :users
end
