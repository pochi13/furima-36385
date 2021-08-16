class MessagesController < ApplicationController


  def create
    @message = Message.new(comment_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private
  def comment_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end