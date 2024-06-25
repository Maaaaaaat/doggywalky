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

    if params[:date].present?
      @walks = @walks.where(date: params[:date])
    end

    if params[:start_time].present?
      @walks = @walks.where(start_time: params[:start_time])
    end

    if params[:adress].present?
      @walks = @walks.where('adress ILIKE ?', "%#{params[:adress]}%")
    end

    if params[:homepage].present?
      @groups = []
    else
      @groups = Group.joins(:walks).where(walks: { id: @walks.pluck(:id) }).distinct
    end
    @walks = [] if params.except(:controller, :action).empty?
  end

end
