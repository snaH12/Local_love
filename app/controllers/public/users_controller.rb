class Public::UsersController < ApplicationController
  before_action :ensure_current_user
  
  def show
    @user = User.find(current_user.id)
  end 

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
     flash[:notice] = "変更を保存しました。"
     redirect_to user_path(current_user.id)
    else
     render :edit
    end 
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :birthplace, :introduction,:profile_image,)
    end
    
    def ensure_current_user
     if !user_signed_in?
       #ログイン/未ログインの処理 未ログインならトップへ
      redirect_to root_path
     end 
    end 
  
end
