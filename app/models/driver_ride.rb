class DriverRide < ApplicationRecord

  validates_presence_of :driver_id
  validates_presence_of :ride_id

  belongs_to :driver, foreign_key: :driver_id
  belongs_to :ride, foreign_key: :ride_id
end
