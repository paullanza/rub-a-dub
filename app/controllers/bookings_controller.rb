class BookingsController < ApplicationController
  before_action :set_tub, only: [:new, :create]
  before_action :set_booking, only: [:approve, :deny]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tub = @tub
    @booking.user = current_user
    if @booking.save
      redirect_to tub_path(@tub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_bookings
    @my_bookings = current_user.bookings
    @my_booked_tubs = current_user.booked_tubs
  end

  def approve
    @booking.approve!
    redirect_to my_bookings_path, notice: "Booking approved."
  end

  def deny
    @booking.deny!
    redirect_to my_bookings_path, notice: "Booking denied."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tub
    @tub = Tub.find(params[:tub_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
