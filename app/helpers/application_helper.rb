module ApplicationHelper
    def login_helper(clas = "")
        if (current_user.is_a?(User) && !current_user.is_a?(GuestUser))
            link_to "Logout", destroy_user_session_path, method: :delete, class: clas
        else
            (link_to "Login", new_user_session_path, class: clas) + "\n".html_safe +
            (link_to "Register", new_user_registration_path, class: clas)
        end
    end
    
    def create_button(text, destination, clas)
       return "<a href='#{destination}' class='#{clas}'>#{text}</a>".html_safe 
    end
    
    def devise_buttons(key, text, clas)
        if key == 'login'
            return create_button text, new_session_path(resource_name), clas
        end
        if key == 'sign_up'
           return create_button text, new_registration_path(resource_name), clas 
        end
        if key == 'forgot'
            return create_button text, new_password_path(resource_name), clas
        end
    end
    
    def source_helper(layoutName)
        if session[:source]
            return content_tag(:p, "Thanks for visiting from #{session[:source]}", class: "source-greeting")
        end
    end
end
