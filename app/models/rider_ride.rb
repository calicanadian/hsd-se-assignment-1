class RiderRide < ApplicationRecord

  belongs_to :rider, foreign_key: :rider_id
  belongs_to :ride, foreign_key: :ride_id
end
