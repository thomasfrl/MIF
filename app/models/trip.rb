class Trip < ApplicationRecord
  belongs_to :correspondance
  belongs_to :host, class_name: "User"
end
