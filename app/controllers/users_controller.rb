class UsersController < ApplicationController
    before_action :authenticate_user!
    

    def profile
      
    end

    def edit_profile

    end

    def update_profile
        if current_user.location
            current_user.location.update(set_location_params)
        else
            location = Location.create(set_location_params)
            current_user.location_id = location.id
        end

        respond_to do |format|
            if current_user.update(set_user_params)
                format.json { render json: current_user, status: :ok }
            else
                format.json { render json: current_user.errors, status: :unprocessable_entity }
            end
        end
    end

    def set_user_params
       params.require(:user).permit(:name, :note, :phone_number, :comment, :age) 
    end

    def set_location_params
        params.require(:location).permit(:address)
    end

end