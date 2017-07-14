class MessagesController < ApplicationController
before_action :group_params , only:[:index,:create]

  def index
    @message = Message.new
    @messages = @group.messages.order('created_at ASC')
    respond_to do |format|
      format.html
      format.json { @new_message = Message.where('id > ?', params[:message][:id]) }
    end
  end

  def create
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

  def group_params
    @group = Group.find(params[:group_id])
  end
end
