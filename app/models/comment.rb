class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :content, presence: true, length: {minimum: 1, maximum: 1000}
end
