class UserRider < ApplicationRecord
  belongs_to :user
  belongs_to :rider
end
