class Rider < ApplicationRecord

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :secret_word
  validates_presence_of :gender
  validates_presence_of :age

  belongs_to :user_riders, optional: true
  has_many :rider_rides, dependent: :destroy
end
