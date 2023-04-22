class Admin::MessagesController < ApplicationController
    
    def destroy
        
        @messages = Message.find(params[:id])
        @messages.destroy
        redirect_to admin_room_path(@messages.room_id)
    end
end
