class GroupsController < ApplicationController
  def index
    @profile = current_user.profile
    @groups = @profile.groups
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    @group.profile = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render 'groups/new', status: :unprocessable_entity
    end
  end

  # def destroy
  #   @group = Group.find(params[:id])
  #   @group.destroy
  #   redirect_to groups_path, status: :see_other
  # end

  private

  def groups_params
    params.require(:group).permit(:name, :description, :city)
  end
end
