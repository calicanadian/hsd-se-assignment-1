class RideRepeater < ApplicationRecord

  validates_presence_of :ride_id, :ride_frequency_id, :name, :description, :start_date, :end_date

  has_and_belongs_to_many :ride_repeater_frequencies
  has_many :ride_frequencies
  has_many :rides
end
