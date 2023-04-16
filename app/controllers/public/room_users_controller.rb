class Public::RoomUsersController < ApplicationController
    
  def create
    room_user = current_user.groom_users.new(room_id: params[:room_id])
    room_user.save
    redirect_to request.referer
  end
  
  def destroy
    room_user = current_user.room_users.find_by(room_id: params[:room_id])
    room_user.destroy
    redirect_to request.referer
  end
end
