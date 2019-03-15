class Comment < ApplicationRecord

  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates :content, length: { in: 10..100 }
  validates :content, presence: true

end
