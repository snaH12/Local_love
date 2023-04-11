# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  before_action :ensure_user, only: [:edit,:update]
  before_action :user_state, only: [:create]

  
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :birthplace)
  end

  def ensure_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
  protected
  def user_state
  @user = User.find_by(name: params[:user][:name])
  return if !@user
  
  if @user.valid_password?(params[:user][:password])&& (@user.is_deleted == true)
  flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
     redirect_to new_user_registration_path
  end
  end
  
end
