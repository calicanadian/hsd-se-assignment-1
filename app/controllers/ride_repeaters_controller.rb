class RideRepeatersController < ApplicationController
  before_action :get_ride_repeater, only: [:update, :destroy]
  # before_action :get_all_repeater_rides, only: [:get_series_for_edit]
  before_action :get_selected_rides_for_edit, only: [:get_series_for_edit, :cancel_series]

  def create
    @ride_repeater = RideRepeater.new(ride_repeater_params)
    if @ride_repeater.save!
      render json: { ride_repeater: @ride_repeater }, status: :created
    else
      render json: { message: "Unable to create Ride Repeater", errors: RideRepeater.errors }, status: 422
    end
  end

  def update
    if @ride_repeater.update_attributes(ride_repeater_params)
      render json: { message: "Ride Repeater updated", ride_repeater: @ride_repeater }, status: :ok
    else
      render json: { message: "Unable to update Ride Repeater", errors: @ride_repeater.errors, ride_repeater: @ride_repeater }, status: 422
    end
  end

  def destroy
    if @ride_repeater.destroy
      render json: { message: "Ride Repeater destroyed" }, status: :ok
    else
      render json: { message: "Unabel to destroy Ride Repeater", errors: @ride_repeater.errors }, status: 422
    end
  end

  def get_series_for_edit
    if @selected_for_edit.blank?
      render json: { message: "No rides match the information provided" }, status: 404
    else
      updated_rides = []
      @selected_for_edit.each do |ride|
        @ride = Ride.find(ride.id)
        @rider_ride = RiderRide.find_by(ride_id: ride.id)
        @ride.update_attributes(ride_series_params)
        updated_rides << [ride: @ride, riders: @rider_ride&.riders]
      end
      render json: { message: "Rides updated!", data: updated_rides }, status: :updated
    end
  end

  def cancel_series
    if @selected_for_edit.blank?
      render json: { message: "No rides match the information provided" }, status: 404
    else
      @selected_for_edit.each do |ride|
        @ride = Ride.find(ride.id)
        @ride.destroy
      end
      # get_selected_rides_for_edit(@selected_for_edit)
      render json: { message: "The selected rides have been canceled." }, status: :ok
    end
  end

  private

  def get_ride_repeater
    @ride_repeater = RideRepeater.find(params[:id])
  end

  def get_all_repeater_rides
    get_ride_repeater()
    @repeated_rides = @ride_repeater&.ride_repeater_frequencies&.rides
  end

  def get_selected_rides_for_edit
    # 1,2,3,4,5,6,7,9,10,12
    series = params[:series].gsub(/\"|\[|\]/, "")
    @selected_for_edit = RideRepeaterFrequency.get_series(series)
  end

  def ride_repeater_params
    params.require(:ride_repeater).permit(:ride_id, :ride_frequency_id, :name, :description, :start_date, :end_date)
  end

  def ride_series_params
    params.permit(:pick_up_longitude, :pick_up_lattitude, :drop_off_longitude, :drop_off_lattitude, :user_id, :is_carpool, :pick_up_time)
  end
end
