class ApplicationController < ActionController::Base
  layout -> { request.xhr? ? false : 'application' }
  
  def logged_in?
    if !current_user
      redirect_to "/users/sign_in"
    end
  end
end
