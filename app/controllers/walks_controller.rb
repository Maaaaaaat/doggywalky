class WalksController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @walks = @group.walks
    @group_name = @group.name
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
