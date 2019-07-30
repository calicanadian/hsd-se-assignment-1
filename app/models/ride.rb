class Ride < ApplicationRecord

  validates_presence_of :pick_up_longitude
  validates_presence_of :pick_up_lattitude
  validates_presence_of :drop_off_longitude
  validates_presence_of :drop_off_lattitude
  validates_presence_of :user_id

  belongs_to :user
  has_many :rider_rides
  has_many :user_rides
  has_many :driver_rides
  has_many :ride_repeater_frequencies

end
