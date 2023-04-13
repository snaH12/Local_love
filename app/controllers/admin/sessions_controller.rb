# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    admin_users_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  private

  def admin_params
    params.require(:admin).permit(:email)
  end
  
end
