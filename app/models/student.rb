class Student < ApplicationRecord
  validates :name, format: { with: /[a-zA-Z]/ }, presence: true
  validates :graduation, presence: true
  validates :hire, presence: true
  validates :position, presence: true
  validates :company, presence: true
  validates :image, presence: true
end
