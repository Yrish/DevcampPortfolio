module DefaultPageContent
    extend ActiveSupport::Concern
    
    included do
        before_action :set_default_content
    end
    
    def set_default_content
       @page_title = "Devcamp"
       @seo_keywords = "Devcamp Portfolio"
       @name = 'Lost'
       @facebook = nil_path
       @twitter = nil_path
       @instagram = nil_path
       @github = nil_path
       @blogabout = "This is a blog that has been created by #{@name} for resons left undeclared in this variable.  Please fix this by going to 'app/controllers/concerns/default_page_content.rb' and then edit the @blogabout varaible"
    end
end