class UserPreference < ApplicationRecord
  belongs_to :user
  belongs_to :preference
  #validates :position, numericality: { greater_than: 0, less_than: 6 }
end
