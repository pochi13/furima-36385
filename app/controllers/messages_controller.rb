class MessagesController < ApplicationController


  def create
    @message = Message.new(comment_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      # 日同期通信を表す記述。第一引数に日同期通信のためのチャンネルを指定し、第二引数に渡す値を記述
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @item = @message.item
    # @messageに紐づいた一つのitemテーブルのレコード
    @message.destroy
    redirect_to item_path(@item)
  end

  private
  def comment_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

# 濃い青はキーを表し、薄い青が入力されたバリューを表す
