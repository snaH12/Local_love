class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  
  
    def index
        @room_lists = Room.all.order(:id)
        @room_joining = RoomUser.where(user_id: current_user.id)
        @room_lists_none = "参加中のグループはありません。"
    end

    def new
        @room = Room.new
        @room.users << current_user
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to rooms_path, notice: 'グループを作成しました。'
        else
            render :new
        end
    end

    def show
        @room = Room.find(params[:id])
        @messages = @room.messages
    end

    def edit
    end

    def update
        if @room.update(room_params)
            redirect_to rooms_path, notice: '更新しました。'
        else
            render :edit
        end
    end

    def destroy
        delete_room = Room.find(params[:id])
        if delete_room.destroy
            redirect_to rooms_path, notice: 'グループを削除しました。'
        end
    end
    
    def join
        room_user = RoomUser.new
        room_user.room_id = params[:id]
        room_user.user_id = current_user.id
        if room_user.save
            redirect_to room_path(params[:id])
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
