class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code,
    presence: true,
    uniqueness: { case_sensitive: false}


  has_one_attached :picture
  has_many :users
end
