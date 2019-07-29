class RideRepeaterFrequecy < ApplicationRecord

  validates_presence_of :ride_id
  validates_presence_of :user_id
  validates_presence_of :driver_id
  validates_presence_of :ride_repeater_id
  validates_presence_of :ride_frequency_id

  belongs_to :ride_repeater
  belongs_to :ride_frequency
  belongs_to :ride
  belongs_to :user
  belongs_to :driver
end
