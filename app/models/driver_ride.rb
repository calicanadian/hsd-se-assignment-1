class DriverRide < ApplicationRecord

  belongs_to :driver, foreign_key: :driver_id
  belongs_to :ride, foreign_key: :ride_id
end
