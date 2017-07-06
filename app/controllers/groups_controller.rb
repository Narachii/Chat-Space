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
    @group = set_group
  end

  def update
    @group = set_group
    if @group.update(group_params)
      redirect_to groups_path,notice:'グループを編集しました。'
    else
      render "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end

  def set_group
    group = Group.find(params[:id])
  end
end
