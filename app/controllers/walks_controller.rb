class WalksController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @walks = @group.walks
    @group_name = @group.name

  def search
    @walks = Walk.all

    if params[:city].present?
      @groups = @groups.where(city: params[:city])
    end

    if params[:date].present?
      @dogs = @dogs.where(age: params[:age])
    end

    if params[:start_time].present?
      @dogs = @dogs.where(castrated: params[:castrated])
    end

    if params[:adress].present?
      @dogs = @dogs.where(breed: params[:breed])
    end
  end

  def show

  end

  def new
  end

  def create
  end

  def update
  end

end
