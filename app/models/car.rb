class Car < ApplicationRecord

  has_one :driver_car
  belongs_to :driver, through: :driver_car
end
