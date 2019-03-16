class Language < ApplicationRecord
  has_many :users, through: :user_languages
  has_one_attached :icon
end
