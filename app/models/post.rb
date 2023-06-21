class Post < ApplicationRecord
  validates :content, length: { maximum: 500 }, presence: true
  validates :image, presence: true
end
