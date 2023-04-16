class Public::MessagesController < ApplicationController
 
  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to room_path(@message.room)
    else
     redirect_to room_path(@message.room)
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
  

end
