class Photo < ApplicationRecord

  belongs_to :user_photos
  belongs_to :driver_photos
  belongs_to :user, through: :user_photos
  belongs_to :driver, through: :driver_photos
end
