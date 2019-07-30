class DriversController < ApplicationController
  before_action :get_driver, only: [:show, :update, :destroy]
  before_action :get_rides, only: [:show,]
  before_action :get_car, only: [:show,]

  def index
    @drivers = Driver.all
    render json: {}, status: 204 and return if @drivers.blank?
    render json: { drivers: @drivers }, status: :ok
  end

  def show
    render json: {}, status: 204 and return if @driver.blank?
    render json: { driver: @driver, rides: @driver_rides, car: @driver_car }, status: :ok
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save!
      render json: { driver: @driver }, status: :created
    else
      render json: { message: "Unable to create driver", errors: @driver.errors }, status: 422
    end
  end

  def update
    if @driver.update_attributes(driver_params)
      render json: { driver: @driver }, status: :created
    else
      render json: { driver: @driver, errors: @driver.errors }, status: 422
    end
  end

  def destroy
    if @driver.destroy
      render json: { message: "Driver destroyed" }, status: :ok
    else
      render json: { message: "Unable to destroy Driver" }, status: 422
    end
  end

  private

  def get_driver
    @driver = Driver.find(params[:id])
  end

  def get_rides
    get_driver()
    @driver_rides = @driver.rides
  end

  def get_car
    get_driver()
    @driver_car = @driver.cars&.last
  end

  def driver_params
    params.require(:driver).permit(:first_name, :last_name, :age, :gender, :bio, :photo_id, :car_id)
  end
end
