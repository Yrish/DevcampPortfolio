module DefaultPageContent
    extend ActiveSupport::Concern
    
    included do
        before_action :set_default_content
    end
    
    def set_default_content
       @page_title = "Devcamp"
       @seo_keywords = "Devcamp Portfolio"
       @name = 'Lost'
    end
end