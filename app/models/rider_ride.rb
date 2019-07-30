class RiderRide < ApplicationRecord

  validates_presence_of :rider_id
  validates_presence_of :ride_id

  belongs_to :rider, foreign_key: :rider_id
  belongs_to :ride, foreign_key: :ride_id

  def self.set_ride_for_riders(ride, rider_ids)
    rider_ids.each do |rider|
      RiderRide.find_or_create_by(ride_id: ride.id, rider_id: rider)
    end
  end
end
