class User < ApplicationRecord
  # after_create :welcome_send

  after_create :set_default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  validates :user_name,
    format: {with: /\A[a-zA-Z0-9 _\.]*\z/} #, uniqueness: {case_sensitive: false}
  validates :first_name,
    presence: true,
    format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  # validates :last_name,
  #   presence: true,
  #   format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  validates :city_id, presence: true

  belongs_to :city, optional: true
  has_one :flat

  has_many :tickets
  has_many :testifies
  has_many :trips, foreign_key: "host_id"
  # Conversations
  has_many :authored_conversations, class_name: "Conversation", foreign_key: "author_id"
  has_many :received_conversations, class_name: "Conversation", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy

  # Correspondances
  has_many :created_correspondances, class_name: "Correspondance", foreign_key: "creator_id"
  has_many :received_correspondances, class_name: "Correspondance", foreign_key: "acceptor_id"

  # Comments
  has_many :authored_comments, class_name: "Comment", foreign_key: "author_id"
  has_many :received_comments, class_name: "Comment", foreign_key: "receiver_id"

  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages

  has_one_attached :avatar



  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(user_name) = :value OR lower(email) = :value", value:login.downcase).first
    else
      where(conditions.to_hash)
    end
  end

  def self.from_facebook(auth)
    where()
  end
  def name
    self.first_name + " " + self.last_name
  end

  def set_default_avatar
    self.avatar.attach(io: File.open("app/assets/images/img/nopic.png"), filename:"nopic.png")
  end

  def conversations
     self.authored_conversations.to_a << self.received_conversations.to_a
  end

  def correspondances
    self.created_correspondances +  self.received_correspondances
  end

  def validated_correspondances
    self.created_correspondances.where(status: "validated") +  self.received_correspondances.where(status: "validated")
  end

  def sent_correspondances
    self.created_correspondances.where(status: "waiting")
  end

  def waiting_correspondances
    self.received_correspondances.where(status: "waiting")
  end

  def refused_correspondances
    self.created_correspondances.where(status: "refused") +  self.received_correspondances.where(status: "refused")
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
