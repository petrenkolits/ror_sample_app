class CitiesController < ApplicationController
  before_action :load_city, only: [:show, :edit, :update, :destroy]
  def new
    @city = City.new
  end

  def create
    @city = City.new city_params
    @city.save ? redirect_to(@city, notice: 'City was successfully created.') :
      render(:new)
  end

  def update
    @city.update(city_params) ? redirect_to(@city, notice: 'City was successfully updated.') :
      render(:edit)
  end

  def destroy
    redirect_to(:back, error: 'Cannot delete city in use!') and return if @city.customers.any? ||
      @city.bookings.any?
    @city.destroy
  end

  private

  def load_city
    @city = City.find params[:id]
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
