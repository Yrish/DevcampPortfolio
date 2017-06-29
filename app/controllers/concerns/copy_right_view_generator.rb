module CopyRightViewGenerator
   extend ActiveSupport::Concern
   
   included do
       before_action :set_default_copyright
    end
    
    def set_default_copyright
        set_copyright "Brysen", "All rights reserved"
    end
   
    def set_copyright name, msg
        @copyright = "<p>&copy; #{Time.now.year} | <b>#{name}</b> #{msg}</p>".html_safe
    end
end