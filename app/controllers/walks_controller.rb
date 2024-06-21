class WalksController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @walks = @group.walks
    @group_name = @group.name
  end

  def show

  end

  def new
    @group = Group.find(params[:group_id])
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walk_params)
    if @walk.save
      redirect_to @walk, notice: 'Walk was successfully created.'
    else
      render :new
    end

  end

  def update
  end


  private

  def walk_params
    params.require(:walk).permit(:date, :start_time, :adress)
  end
end
