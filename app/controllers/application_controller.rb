class ApplicationController < ActionController::Base
    before_action :configure_devise_params, if: :devise_controller?
#    before_action :configure_permitted_parameters, if: :devise_controller?

    def authenticate_admin!
        if !current_user
            redirect_to new_user_session_path, notice: "You need to log in as an admin"
        elsif !current_user.admin?
            redirect_to root_path, notice: "you are not an admin"
        end
    end

    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:name, :email, :phone_number, :age, :note, :location_id, :password, :password_confirmation)
        end
    end

 #   protected
 #
 #   def configure_permitted_parameters
 #       devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
 #   end  

end
