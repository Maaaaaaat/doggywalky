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

  def group_user
    @group = Group.find(params[:group_id])
    @dogs = @profile.dogs
  end

  def join
    @profile_group = ProfileGroup.new
    @profile_group.profile = current_user.profile
    @profile_group.group = Group.find(params[:group_id])
    @profile_group.save!
    redirect_to profile_groups_path(@profile)
  end


  def quit
    @profile = current_user.profile
    @group = Group.find(params[:profile_group_id])
    @profile.groups.delete(@group)
    redirect_to profile_groups_path(@profile)
  end
  # def destroy
  #   @group = Group.find(params[:id])
  #   @group.destroy
  #   redirect_to groups_path, status: :see_other
  # end

  private

  # def set_profile
  #   @profile = Profile.find(params[:profile_id])
  # end

  def groups_params
    params.require(:group).permit(:name, :description, :city)
  end
end
