class RidesController < ApplicationController
  before_action :get_user, only: [:index, :create, :destroy]
  before_action :get_ride, only: [:show, :update, :destroy]

  def index
    if @user.blank?
      render json: {}, status: 401
    else
      @user_rides = @user.rides.all
      render json: { data: { user_id: @user.id, rides: @user_rides } }, status: :ok
    end
  end

  def show
    @riders = []
    rider_array = params[:riders].gsub(/\\"|\[|\]/, "").split(",")
    rider_array.each do |r|
      @riders << @user&.user_riders.where(rider_id: r.to_i).first&.rider
    end
    if @ride.blank?
      render json: { message: "No ride matches these criteria" }, status: 404
    elsif @riders.blank?
      render json: { message: "No rides match that rider" }, status: 404
    else
      render json: { data: { user_id: @user.id, riders: @riders.as_json, ride: @ride } }, status: :ok
    end
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = @user.id
    rider_array = params[:riders].gsub(/\\"|\[|\]/, "").split(",")
    if @ride.save!
      RiderRide.set_ride_for_riders(@ride, rider_array)
      render json: {
        data: {
          user_id: @user.id,
          ride: @ride
        }
      }, status: :created
    else
      render json: { message: "Unable to create new ride", errors: @ride.errors }, status: 422
    end
  end

  def update
    if @ride.update_attributes(ride_params)
      @riders = params[:riders].gsub(/\\"|\[|\]/, "").split(",")
      RiderRide.set_ride_for_riders(@ride, @riders)
      render json: { ride: @ride }, status: :ok
    else
      render json: { message: "Unable to update Ride", errors: @ride.errors }, status: 422
    end
  end

  def destroy
    if @ride.destroy
      render json: { message: "Ride destroyed" }, status: :ok
    else
      render json: { message: "Unable to destroy Ride", errors: @ride.errors }, status: 422
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def get_ride
    get_user()
    @ride = @user&.rides.where(id: params[:ride_id]).first
  end

  def ride_params
    params.require(:ride).permit(:pick_up_longitude, :pick_up_lattitude, :drop_off_longitude, :drop_off_lattitude, :user_id, :is_carpool, :pick_up_time)
  end

end
