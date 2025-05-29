class TubsController < ApplicationController
  before_action :set_tub, only: [:show]

  def index
    @tubs = Tub.all
    set_markers
  end

  def show
    @tub = Tub.find(params[:id])
    @soak = Soak.new
    @markers = [{
        lat: @tub.latitude,
        lng: @tub.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {tub: @tub}),
        marker_html: render_to_string(partial: "map_marker")
      }]
  end

  def new
    @tub = Tub.new
  end

  def create
    @tub = Tub.new(tub_params)
    @tub.user = current_user
    if @tub.save
      redirect_to tub_path(@tub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_tubs
    @tubs = Tub.where(user: current_user)
    set_markers
  end

  private

  def set_tub
    @tub = Tub.find(params[:id])
  end

  def set_markers
    @markers = @tubs.geocoded.map do |tub|
      {
        lat: tub.latitude,
        lng: tub.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {tub: tub}),
        marker_html: render_to_string(partial: "map_marker")
      }
    end
  end

  def tub_params
    params.require(:tub).permit(:name, :address, :description, :price, :size, :category, photos: [])
  end
end
