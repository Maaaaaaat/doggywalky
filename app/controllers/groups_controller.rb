class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:id])
    @group_name = @group.name
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
