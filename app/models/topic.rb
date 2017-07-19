class Topic < ApplicationRecord
    
    validates_presence_of :title
    
    has_many :blogs
    
    extend FriendlyId
    friendly_id :title, use: :slugged
end
