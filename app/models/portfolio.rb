class Portfolio < ApplicationRecord
    include Placeholder
    has_many :technologies
    validates_presence_of :title, :body, :main_image, :thumb_image
    
    def self.capture(string:)
        where(subtitle: string)
    end
    
    scope :someting_awesome, -> {where(subtitle: "Something Awesome")}
    
    after_initialize :set_defaults
    
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: Portfolio.all.count * 10 + 10, width: Portfolio.all.count * 20 + 10)
        self.thumb_image ||= Placeholder.image_generator(height: Portfolio.all.count * 2 + 10, width: Portfolio.all.count + 10)
    end
end
