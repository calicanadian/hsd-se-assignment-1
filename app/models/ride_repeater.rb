class RideRepeater < ApplicationRecord

  validates_presence_of :ride_id, :ride_frequency_id, :name, :description, :start_date, :end_date

  has_and_belongs_to_many :ride_repeater_frequencies
  has_many :ride_frequencies
  has_many :rides

  after_create :create_repeating_rides

  def create_repeating_rides
    ride_frequency = self.ride_frequency_id.blank? ? nil : RideFrequency.find(self.ride_frequency_id).designation
    ride = self.ride_id.blank? ? nil : Ride.find(self.ride_id)
    frequency = (ride_frequency == "P0") ? 52 : ((ride_frequency == "P1") ? 26 : 0)
    multiplier = (frequency == 52) ? 1 : 2
    frequency.times do |i|
      ride_time = ride.pick_up_time + ((i + 1) * multiplier).weeks
      repeat_ride = Ride.create(pick_up_longitude: ride.pick_up_longitude,
                  pick_up_lattitude: ride.pick_up_lattitude,
                  drop_off_longitude: ride.drop_off_longitude,
                  drop_off_lattitude: ride.drop_off_lattitude,
                  user_id: ride.user_id,
                  is_carpool: ride.is_carpool,
                  pick_up_time: ride.pick_up_time)
      ride_frequency = RideRepeaterFrequency.new(ride_repeater_id: self.id, ride_frequency_id: self.ride_frequency_id, ride_id: repeat_ride.id, user_id: ride.user_id)
      ride_frequency.save!
    end
  rescue => e
    # log to service, email admins, return value to trigger response to user
  end
end
