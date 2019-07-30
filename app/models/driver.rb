class Driver < ApplicationRecord

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :bio
  validates :first_name, length: { minimum: 2, maximum: 30 }
  validates :last_name, length: { minimum: 2, maximum: 30 }

  has_many :driver_rides
  has_many :driver_photos
  has_many :driver_cars
  has_many :rides, through: :driver_rides
  has_many :photos, through: :driver_photos
  has_many :cars, through: :driver_cars
  has_many :ride_repeater_frequencies
  has_many :reviews


end
