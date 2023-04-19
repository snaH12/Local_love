class Public::RoomsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end
  
  def join
    @room = Room.find(params[:room_id])
    @room.users << current_user
    redirect_to  room_path(@room)
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.owner_id = current_user.id
    
    @room.users << current_user
    if @room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render "edit"
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.users.delete(current_user)
    redirect_to rooms_path
  end


  private

  def room_params
    params.require(:room).permit(:name)
  end

  def ensure_correct_user
    @room = Room.find(params[:id])
    unless @room.owner_id == current_user.id
      redirect_to rooms_path
    end
  end
end
