class Rider < ApplicationRecord

  validates_uniqueness_of :first_name
  validates_uniqueness_of :last_name
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :secret_word
  validates_presence_of :gender
  validates_presence_of :age
  validates :username, length: { minimum: 5, maximum: 30 }

  has_many :user_riders
  belongs_to :user, through: :user_riders
end
