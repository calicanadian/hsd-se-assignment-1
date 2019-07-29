class UserRider < ApplicationRecord

  validates_presence_of :user_id
  validates_presence_of :rider_id

  belongs_to :user
  belongs_to :rider
end
