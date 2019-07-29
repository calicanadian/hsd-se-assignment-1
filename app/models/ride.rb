class Ride < ApplicationRecord

  belongs_to :user, foreign_key: :organizer_id
  has_many :rider_rides
  has_many :ride_repeater_frequencies
  belongs_to :rider, through: :rider_rides
  belongs_to :ride_repeater, through: :ride_repeater_frequncy
  belongs_to :ride_frequency, through: :ride_repeater_frequncy

end
