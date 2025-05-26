class TubsController < ApplicationController
  def index
    @tubs = Tub.all
  end

  def show
    @tub = Tub.find(params[:id])
  end
end
