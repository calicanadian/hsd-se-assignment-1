class User < ApplicationRecord

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :photos
  has_many :user_photos
  has_many :user_riders
  has_many :riders, through: :user_riders
  has_many :rides, foreign_key: :organizer_id
  has_many :ride_repeater_frequencies
  has_and_belongs_to_many :reviews
end
