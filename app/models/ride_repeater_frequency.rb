class RideRepeaterFrequency < ApplicationRecord

  validates_presence_of :ride_id
  validates_presence_of :user_id
  validates_presence_of :ride_repeater_id
  validates_presence_of :ride_frequency_id

  belongs_to :ride_repeater
  belongs_to :ride_frequency
  belongs_to :ride
  belongs_to :user
  belongs_to :driver, optional: true

  def self.get_series(series_ids)
    select("rides.*")
    .joins("LEFT OUTER JOIN rides ON ride_repeater_frequencies.ride_id = rides.id")
    .where("ride_repeater_frequencies.id IS NOT NULL AND ride_repeater_frequencies.ride_id = ANY(ARRAY[#{series_ids}])")
  end
end
