class Skill < ApplicationRecord
    include placeholder
    validates_presence_of :title, :percent_utilized

    def set_defaults
        self.badge ||= Placeholder.image_generator(hieght: 75, width: 100)
    end
end
