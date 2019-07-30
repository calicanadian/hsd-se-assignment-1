# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # The rides table would be a record of all rides, regardless of user account, rider, or driver. It would have a belongs_to relationship to the user table. This table has an is_carpool boolean to indicate if it is to be shared with other riders.

  create_table "rides", force: :cascade do |t|
    t.decimal "pick_up_longitude" # longitude of pick up spot
    t.decimal "pick_up_lattitude" # lattitude of pick up spot
    t.decimal "drop_off_longitude" # longitude of drop off point
    t.decimal "drop_off_lattitude" # lattitude of drop off point
    t.integer "user_id" # foreign key to user
    t.boolean "is_carpool" # boolean indicator of carpool
    t.datetime "pick_up_time" # desired time of pick up
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The riders table is representative of the passengers who would be taking the rides. This table has a belongs_to relationship with the user table.

  create_table "riders", force: :cascade do |t|
    t.string "first_name" # first name of rider
    t.string "last_name" # last name of rider
    t.string "secret_word" # secret word to help identify rider and driver
    t.integer "photo_id" # superfluous reference to photos table
    t.string "gender" # gender of rider
    t.string "age" # age of rider
    t.integer "user_id" # foreign key to user
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The users table is the top level table which access the account. Data in this table would be used for authentication. Users will have has_many relationships to riders and rides

  create_table "users", force: :cascade do |t|
    t.string "username" # username for auth
    t.string "email" # email for communications
    t.string "phone_number" # phone number for mobile sms alerts
    t.string "first_name" # first name of user
    t.string "last_name" # last name of user
    t.string "password_digest" # password digest of hash for BCrypt
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The drivers table is representative of the account for the person who will be providing the service. This will provide basic information about the driver.

  create_table "drivers", force: :cascade do |t|
    t.string "first_name" # first name of driver
    t.string "last_name" # last name of driver
    t.string "age" # age of driver
    t.string "gender" # gender of driver
    t.text "bio" # biography of driver
    t.integer "photo_id" # superfluous reference to photos table
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The cars table will store information about cars that are being used to provide the rides. Information such as the visual identifying aspects of the vehicle are stored here. Also information about the eligibility for use and number of seats which can be used for one or many riders.

  create_table "cars", force: :cascade do |t|
    t.string "make" # car manufacturer
    t.string "model" # car type
    t.string "color" # car color
    t.string "year" # year of car
    t.integer "number_of_seats" # number of seats available in a car
    t.string "insurance_provider" # insurance company
    t.string "registration_year" # year of current registration
    t.string "registration_month" # month of current registration
    t.datetime "registration_expiration" # expiration date of registration
    t.integer "driver_id" # foreign key to driver
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # This is an association table to provide one to many or many to one relationships between a driver and the rides which they performed.

  create_table "driver_rides", force: :cascade do |t|
    t.integer "driver_id" # foreign key to driver
    t.integer "ride_id" # foreign key to ride
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The driver_cars table will be a record of all of the cars which a driver owns. A driver could own many cars, but only one will be in service at a time. This sets up a one to many relationship between the driver and their cars.

  create_table "driver_cars", force: :cascade do |t|
    t.integer "driver_id" # foreign key to driver
    t.integer "car_id" # foreign key to car
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The rider_rides table records a history of all the rides which a rider has taken. This provides a one to many or many to one relationship between the two tables. With this relationship, information about a ride can be gleaned from the parent user, through the child rider. We can also chain to the driver through the rides > driver_rides table.

  create_table "rider_rides", force: :cascade do |t|
    t.integer "rider_id" # foreign key to rider
    t.integer "ride_id" # foreign key to ride
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The user_riders table sets up the association between a parent user and all of the children riders. Using this table we can gain insight to the user from the rider or the user from the ride. We can also provide a table of rides a rider has taken to the user as a historical record.

  create_table "user_riders", force: :cascade do |t|
    t.integer "user_id" # foreign key to user
    t.integer "rider_id" # foreign key to rider 
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The ride_frequencies table is used to determine the frequency at which repeating rides can be defined. Per the requirements, the two ride frequencies are "P1", and "P0". While storing these values in a constant would also be sufficient for the current MVP, this will allow for scaleability in the future when other types of repeating frequencies are developed.

  create_table "ride_frequencies", force: :cascade do |t|
    t.string "name" # A name to be given to the frequency 'Weekly'
    t.string "description" # A simple description of the frequency 'Once a week.'
    t.string "designation" # the alpha-numeric designation provided in spec "P0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The ride_repeaters table will help make associations between rides and ride_frequencies. This way we can retain record of which ride was repeated and retain innumerable data about that ride.

  create_table "ride_repeaters", force: :cascade do |t|
    t.integer "ride_id" # Reference to the ID being repeated
    t.integer "ride_frequency_id" # Reference to the repeating frequency
    t.string "name" # A simple name meant to be human friendly
    t.text "description" # A description to help users track their repeating rides
    t.datetime "start_date" # The date the repeating rides should start
    t.datetime "end_date" # The date the repeating rides should end
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # The ride_repeater_frequencies table is a hub for all of the main tables to gain access to associative records. The name of the table really should be ride_rider_user_driver_repeater_frequencies, but that would be verbose. :)
  # This table is helpful when we want to edit or cancel repeating rides independently or as an entire series. The interface would supply the ride_id for the selected repeating rides (1 ride, some rides, or all rides) and be used to make updates or cancel the rides they are mapped to.

  create_table "ride_repeater_frequecies", force: :cascade do |t|
    t.integer "ride_repeater_id" # foreign key to ride_repeaters
    t.integer "ride_frequency_id" # foreign key to ride_frequencies
    t.integer "ride_id" # foreign key to rides
    t.integer "user_id" # foreign key to users
    t.integer "driver_id" # foreign key to drivers
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
