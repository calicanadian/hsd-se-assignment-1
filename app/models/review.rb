class Review < ApplicationRecord

  validates_presence_of :user_id, :driver_id, :description, :text

  belongs_to :driver, foreign_key: :driver_id
  belongs_to :user, foreign_key: :user_id
end
