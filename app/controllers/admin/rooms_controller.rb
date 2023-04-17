class Admin::RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_rooms_path
  end


  private

  def room_params
    params.require(:room).permit(:name)
  end
end
