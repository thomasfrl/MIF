class User < ApplicationRecord


  belongs_to :city
  has_one :flat
  has_many :messages
  has_many :conversations
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :tickets
  has_many :comments
  has_many :testifies
  has_many :correspondances
  has_many :trips

end
