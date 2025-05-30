class TubsController < ApplicationController
  before_action :set_tub, only: [:show]

  def index
    @tubs = policy_scope(Tub)
    set_markers

    if params[:query].present?
      @tubs = Tub.search_by_name_and_description(params[:query])
    end

    @tubs = @tubs.where(category: params[:category]) if params[:category].present?
    @tubs = @tubs.where(size: params[:size]) if params[:size].present?

    if params[:min_price].present?
      @tubs = @tubs.where("price >= ?", params[:min_price].to_f)
    end

    if params[:max_price].present?
      @tubs = @tubs.where("price <= ?", params[:max_price].to_f)
    end
  end

  def show
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
    authorize @tub
  end

  def create
    @tub = Tub.new(tub_params)
    @tub.user = current_user
    authorize @tub

    if @tub.save
      redirect_to tub_path(@tub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_tubs
    @tubs = Tub.where(user: current_user)
    authorize Tub
    set_markers
  end

  private

  def set_tub
    @tub = Tub.find(params[:id])
    authorize @tub
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
