class ProfilesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
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
    # redirect_to restaurant_path(@restaurant)
  end

  def delete
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :city, :gender, :street)
  end
end
