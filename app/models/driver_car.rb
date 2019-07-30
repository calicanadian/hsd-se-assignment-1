class DriverCar < ApplicationRecord

  validates_presence_of :driver_id
  validates_presence_of :car_id

  belongs_to :car, foreign_key: :car_id
  belongs_to :driver, foreign_key: :driver_id
end
