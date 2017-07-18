class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :content, presence: true, length: {minimum: 1, maximum: 1000}
  
  after_create_comit {CommentBroadcastJob.perform_later(self)}
end
