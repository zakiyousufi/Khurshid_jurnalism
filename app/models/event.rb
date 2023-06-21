class Event < ApplicationRecord
  validates :title, format: { with: /[a-zA-Z]/ }, presence: true  
  validates :image, presence: true
end
