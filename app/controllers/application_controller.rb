class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if current_user.is_admin        
      stored_location_for(resource) || admin_root_path
    else
      stored_location_for(resource) || user_path(current_user.id)
    end     
  end 
end
