class Post < ApplicationRecord
  validates :content, presence: true
  validates :image, presence:true
end
