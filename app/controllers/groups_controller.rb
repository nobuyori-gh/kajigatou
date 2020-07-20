class GroupsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @group = Group.new(group_params)
    @group.save
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
