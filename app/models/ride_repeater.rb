class RideRepeater < ApplicationRecord

  has_and_belongs_to_many :ride_repeater_frequencies
  has_many :ride_frequencies
  has_many :rides
end
