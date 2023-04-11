class Public::UsersController < ApplicationController
    
  before_action :ensure_guest_user, only: [:edit]
  
  
  def show
    @user = User.find(params[:id])
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
  
  def unsubscribe
  end 
  
  #退会処理
  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :birthplace, :introduction,:profile_image,)
    end
    
    def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
    end  
  
end
