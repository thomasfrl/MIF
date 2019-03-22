class Budget < ApplicationRecord
  has_many :users
  has_one_attached :icon
end
