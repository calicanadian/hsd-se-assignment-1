class Rider < ApplicationRecord
  has_many :user_riders
  belongs_to :user, through: :user_riders
end
