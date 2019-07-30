class Car < ApplicationRecord

  validates_presence_of :make, :model, :color, :year, :number_of_seats, :insurance_provider, :registration_year, :registration_month, :registration_expiration, :driver_id

  has_one :driver_car
  belongs_to :driver

  def get_valid_car(driver)
    select("cars.make, cars.model, cars.color, cars.year, cars.number_of_seats")
    .where("cars.driver_id = #{driver.id}
      AND (cars.insurance_provider IS NOT NULL
        AND cars.registration_year IS NOT NULL
        AND cars.registration_month IS NOT NULL
        AND cars.registration_expiration IS NOT NULL)
      AND (TO_CHAR((cars.registration_expiration - interval '8 hour'), 'YYYY-MM-DD HH:MI AM PST') > TO_CHAR((NOW() + interval '30 day'), 'YYYY-MM-DD HH:MI AM PST'))")
  end
end
