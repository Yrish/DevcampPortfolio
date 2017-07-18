class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_presence_of :title, :body
  
  belongs_to :topic
  
  has_many :comments, dependent: :destroy
  
  after_initialize :set_defaults
  
  def set_defaults
    self.topic ||= Topic.last
  end
  
  def self.set_order
    order("updated_at DESC")
  end
end
