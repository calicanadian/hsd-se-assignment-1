class RiderRide < ApplicationRecord

  validates_presence_of :rider_id
  validates_presence_of :ride_id

  belongs_to :rider, foreign_key: :rider_id
  belongs_to :ride, foreign_key: :ride_id
end
