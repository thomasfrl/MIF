class Quiz < ApplicationRecord
  has_many :quiz_convs, dependent: :destroy
  scope :level1, -> {where(level: 1)}
  scope :level2, -> {where(level: 2)}
  scope :level3, -> {where(level: 3)}
end
