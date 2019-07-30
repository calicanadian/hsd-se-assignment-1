class User < ApplicationRecord

  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number
  validates_uniqueness_of :first_name
  validates_uniqueness_of :last_name

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :username, length: { minimum: 5, maximum: 30 }
  validates :first_name, length: { minimum: 2, maximum: 30 }
  validates :last_name, length: { minimum: 2, maximum: 30 }



  has_many :friendships
  has_many :friends, through: :friendships
  has_many :photos
  has_many :user_photos
  has_many :user_riders
  has_many :rides, foreign_key: :user_id
  has_many :ride_repeater_frequencies
  has_many :reviews
end
