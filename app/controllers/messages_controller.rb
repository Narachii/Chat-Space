class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages.order('created_at ASC')
    @message = Message.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(create_params)
    if @message.save
       respond_to do |format|
      format.html {redirect_to group_messages_path}
      format.json
    end
    else
      redirect_to group_messages_path,alert: "メッセージを入力してください。"
    end
  end

  private
  def create_params
    params.require(:message).permit(:body,:image).merge(user_id: current_user.id,group_id: params[:group_id])
  end

end
