class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path,notice: 'グループを作成しました。'
    else
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if current_user.id = group.user_ids
      group.update(group_params)
    end
      redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end

end
