class Ticket < ApplicationRecord
  validates :object, presence: true
  validates :category, presence: true
  validates :content, presence: true

  belongs_to :user
end
