class ProfilesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @profilenew = Profile.new
  end

  def create
    @profilenew = Profile.new(profile_params)
    @profilenew.user = current_user
    if @profilenew.save!
    redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to root_path
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to root_path, notice: 'Profil supprimé avec succès.'
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :city, :gender, :street)
  end
end
