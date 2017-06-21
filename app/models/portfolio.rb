class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image
    
    def self.angular
        where(subtitle: 'Angular')
    end
    
    scope :someting_awesome, -> {where(subtitle: "Something Awesome")}
    
    after_initialize :set_defaults
    
    def set_defaults
        self.main_image ||= "http://placehold.it/#{Portfolio.all.count * 20 + 10}x#{Portfolio.all.count * 10 + 10}"
        self.thumb_image ||= "http://placehold.it/#{Portfolio.all.count * 2 + 10}x#{Portfolio.all.count + 10}"
    end
end
