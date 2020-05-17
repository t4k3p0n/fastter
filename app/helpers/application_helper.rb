module ApplicationHelper
    def resource_name
        :user
     end
     
     def resource
        @resource ||= User.new
     end
     
     def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
     end

     def devise_error_messages
        return "" if resource.errors.empty?
        html = ""
        messages = resource.errors.full_messages.each do |msg|
          html += <<-EOF
            <div class="error_field alert alert-danger" role="alert">
              <p class="error_msg">#{msg}</p>
            </div>
          EOF
        end
        html.html_safe
      end

    
end
