class TubsController < ApplicationController
  before_action :set_tub, only: [:show]

  def index
    @tubs = Tub.all
  end

  def show
    @tub = Tub.find(params[:id])
    @soak = Soak.new
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

  private

  def set_tub
    @tub = Tub.find(params[:id])
  end

  def tub_params
    params.require(:tub).permit(:name, :description, :price, :size, :category)
  end
end
