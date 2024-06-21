class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @groups = Group.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude
      }
    end
  end

  def search
    @walks = Walk.all
    @groups = Group.all

    if params[:city].present?
      @groups = @groups.where(city: params[:city])
    end

    if params[:date].present?
      @walks = @walks.where(date: params[:date])
    end

    if params[:start_time].present?
      @walks = @walks.where(start_time: params[:start_time])
    end

    if params[:address].present?
      @walks = @walks.where(address: params[:address])
    end

  end
end
