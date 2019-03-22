class Budget < ApplicationRecord
  has_many :users
  has_on_attached :icon
end
