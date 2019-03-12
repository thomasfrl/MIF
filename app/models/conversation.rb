class Conversation < ApplicationRecord
  validates :author, uniqueness: {scope: :receiver}

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy
end
