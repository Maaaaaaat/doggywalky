class WalksController < ApplicationController
  before_action :set_group
  before_action :set_walk, only: [:show, :edit, :update]


  def index
    @group = Group.find(params[:group_id])
    @walks = @group.walks
    @group_name = @group.name
  end

  def show
  end

  def new
    @walk = Walk.new
  end

  def create
    @group = Group.find(params[:group_id])
    @walk = Walk.new(walk_params)
    @walk.group = @group  # Associe le walk au groupe
    @walk.profile = current_user.profile  # Associe le walk au profil de l'utilisateur connecté

    if @walk.save
      redirect_to group_walks_path(@group, @walk), notice: 'Promenade créée avec succès.'
    else
      render :new
    end
  end

  def join
    @profile_walk = ProfileWalk.new
    @profile_walk.profile = current_user.profile
    @group = Group.find(params[:group_id].to_i)
    @profile_walk.walk = Walk.find(params[:walk_id])
    @profile_walk.save!
    redirect_to group_walks_path(@group)
  end

  def quit
    @profile = current_user.profile
    @group = Group.find(params[:group_id].to_i)
    @walk = Walk.find(params[:profile_walk_id])
    profile_walk = @profile.profile_walks
    result = profile_walk.find { |walk| walk.walk_id == @walk.id}
    result.destroy
    redirect_to group_walks_path(@group)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_walk
    @walk = @group.walks.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit(:date, :start_time, :adress)
  end
end
