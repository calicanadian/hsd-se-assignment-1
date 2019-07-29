class Driver < ApplicationRecord

  has_many :driver_rides
  has_many :driver_photos
  has_many :driver_cars
  has_many :rides, through: :driver_rides
  has_many :photos, through: :driver_photos
  has_many :cars, through: :driver_cars
  has_many :ride_repeater_frequencies
  has_many :reviews


end
