class RideFrequency < ApplicationRecord

  validates_presence_of :designation

  has_many :ride_repeater_frequencies
  belongs_to :ride_repeater
end
