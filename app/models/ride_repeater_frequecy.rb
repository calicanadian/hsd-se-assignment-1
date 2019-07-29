class RideRepeaterFrequecy < ApplicationRecord

  belongs_to :ride_repeater
  belongs_to :ride_frequency
  belongs_to :ride
  belongs_to :user
  belongs_to :driver
end
