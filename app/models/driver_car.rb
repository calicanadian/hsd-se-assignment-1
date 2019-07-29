class DriverCar < ApplicationRecord

  belongs_to :car, foreign_key: :car_id
  belongs_to :driver, foreign_key: :driver_id
end
