class Car < ApplicationRecord

  validates_presence_of :make, :model, :color, :year, :number_of_seats, :insurance_provider, :registration_year, :registration_month, :registration_expiration, :driver_id

  has_one :driver_car
  belongs_to :driver, through: :driver_car
end
