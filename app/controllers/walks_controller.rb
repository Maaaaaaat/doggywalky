class WalksController < ApplicationController
  def index
    @group = Group.find(params[:id])

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
