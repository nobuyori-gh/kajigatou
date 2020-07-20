class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    # @user = current_user
    # user_url(resource)
    root_path
  end
end
