class WalksController < ApplicationController
  def index
    @group = Group.find(params[:id])
    
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
