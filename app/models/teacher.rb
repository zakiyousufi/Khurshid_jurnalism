class Teacher < ApplicationRecord
  validates :name, format: { with: /[a-zA-Z]/ }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
  validates :image, presence: true
end
