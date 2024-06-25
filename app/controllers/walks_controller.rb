class WalksController < ApplicationController
  before_action :set_group

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
    @profile_walk.walk = Walk.find([:walk_id])
    @profile_walk.save!
    redirect_to group_walks_path(@profile, @walk)
  end

  def update
  end


  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def walk_params
    params.require(:walk).permit(:date, :start_time, :adress)
  end
end
