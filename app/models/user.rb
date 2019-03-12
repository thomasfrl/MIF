class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city, optional: true
  has_one :flat

  has_many :tickets
  has_many :testifies

  # Conversations
  has_many :authored_conversations, class_name: "Conversation", foreign_key: "author_id"
  has_many :received_conversations, class_name: "Conversation", foreign_key: "received_id"
  has_many :messages, dependent: :destroy

  # Correspondances
  has_many :primary_correspondances, class_name: "Correspondance", foreign_key: "user_one_id"
  has_many :secondary_correspondances, class_name: "Correspondance", foreign_key: "user_two_id"

  # Comments
  has_many :authored_comments, class_name: "Comment", foreign_key: "author_id"
  has_many :received_comments, class_name: "Comment", foreign_key: "received_id"

  has_many :user_languages
  has_many :languages, through: :user_languages


end
