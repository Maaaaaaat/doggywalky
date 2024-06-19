class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home ]
  before_action :set_devise_variables, only: [:index]

  def index
  end

  private

  def set_devise_variables
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end
end
