class RideFrequency < ApplicationRecord

  has_many :ride_repeater_frequencies
  belongs_to :ride_repeater
end
