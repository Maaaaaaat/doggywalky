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
    if @group.save
      @group.profile_groups.create(profile: @profile)  # Association via ProfileGroup
      redirect_to profile_group_path(@profile, @group), notice: 'Groupe créé avec succès.'
    else
      render :new
    end
  end

  # def destroy
  #   @group = Group.find(params[:id])
  #   @group.destroy
  #   redirect_to groups_path, status: :see_other
  # end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def groups_params
    params.require(:group).permit(:name, :description, :city)
  end
end
