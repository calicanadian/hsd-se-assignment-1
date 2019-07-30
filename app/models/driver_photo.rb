class DriverPhoto < ApplicationRecord

  belongs_to :photo, foreign_key: :photo_id
  belongs_to :driver, foreign_key: :driver_id
end
