class GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @user = current_user
    if @group.save
      redirect_to group_path(@group), notice: "保存できました"
    else
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def update
  end

  private

  def group_params
    params.require(:group).permit(:name,:description,:image_id)
  end
end
