class HomeController < ApplicationController
  def create_booking
    @booking = BookAction.new
  end

  def do_book
    @booking = BookAction.new(book_params.update date: format_datetime).save
    @booking.errors.any? ? render(:create_booking) :
      redirect_to(booking_path(@booking), notice: 'booking was successfully created.')
  end

  private

  def book_params
    params.require(:book_action).permit(:first_name, :last_name, :phone_number, :city_id)
  end

  def format_datetime
    Time.zone.local(*1.upto(5).map { |i| params[:book_action]["date(#{i}i)"].to_i })
  end
end
