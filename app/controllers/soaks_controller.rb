class SoaksController < ApplicationController
  before_action :set_tub, only: [:new, :create]
  before_action :set_soak, only: [:approve, :deny]

  def new
    @soak = Soak.new
    authorize @soak
  end

  def create
    @soak = Soak.new(soak_params)
    @soak.tub = @tub
    @soak.user = current_user
    authorize @soak

    if @soak.save
      redirect_to tub_path(@tub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_soaks
    authorize Soak, :my_soaks?
    @my_soaks = current_user.soaks
    @my_booked_tubs = current_user.booked_tubs
  end

  def approve
    @soak.approve!
    redirect_to my_soaks_path, notice: "soak approved."
  end

  def deny
    @soak.deny!
    redirect_to my_soaks_path, notice: "soak denied."
  end

  private

  def set_soak
    @soak = Soak.find(params[:id])
    authorize @soak
  end

  def set_tub
    @tub = Tub.find(params[:tub_id])
  end

  def soak_params
    params.require(:soak).permit(:start_date, :end_date)
  end
end
