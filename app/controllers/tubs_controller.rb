class TubsController < ApplicationController
  def index
    @tubs = Tub.all
  end
end
