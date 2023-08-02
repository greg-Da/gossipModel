class ApplicationController < ActionController::Base

    private

    def is_logged_in?
        if session[:user_id] == nil
          flash[:danger] = "You must be logged in to access this section"
          redirect_back_or_to root_path
        end
    end
end
