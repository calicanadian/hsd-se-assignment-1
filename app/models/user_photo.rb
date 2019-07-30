class UserPhoto < ApplicationRecord

  belongs_to :photo, foreign_key: :photo_id
  belongs_to :user, foreign_key: :user_id
end
