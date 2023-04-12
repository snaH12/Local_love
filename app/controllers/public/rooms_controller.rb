class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  
    def index
        @room_lists = Room.all.order(:id)
        @room_joining = RoomUser.where(user_id: current_user.id)
        @room_lists_none = "You don't join any groups."
    end

    def new
        @room = Room.new
        @room.users << current_user
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to rooms_path, notice: 'make a group.'
        else
            render :new
        end
    end

    def show
        @room = Room.find(params[:id])
        @messages = @room.messages
    end

    def edit
        # @group = Group.find(params[:id])
    end

    def update
        # @group = Group.find(params[:id])
        if @room.update(room_params)
            redirect_to rooms_path, notice: 'update your group.'
        else
            render :edit
        end
    end

    def destroy
        delete_room = Room.find(params[:id])
        if delete_room.destroy
            redirect_to rooms_path, notice: 'delete your group.'
        end
    end

    private
    def set_group
        @room = Room.find(params[:id])
    end

    def room_params
        params.require(:room).permit(:roomname, user_ids: [])
    end
  
end
