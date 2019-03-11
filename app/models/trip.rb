class Trip < ApplicationRecord
  belongs_to :correspondance, class_name: "User"
  belongs_to :host, class_name: "User"
end
