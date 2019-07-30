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

ActiveRecord::Schema.define(version: 2019_07_29_165313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "year"
    t.integer "number_of_seats"
    t.string "insurance_provider"
    t.string "registration_year"
    t.string "registration_month"
    t.datetime "registration_expiration"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_cars", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_photos", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_rides", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "age"
    t.string "gender"
    t.text "bio"
    t.integer "photo_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.string "file"
    t.string "filename"
    t.integer "filesize"
    t.string "filetype"
    t.string "bucket"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "star_count"
    t.string "description"
    t.text "text"
    t.integer "user_id"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ride_frequencies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ride_repeater_frequecies", force: :cascade do |t|
    t.integer "ride_repeater_id"
    t.integer "ride_frequency_id"
    t.integer "ride_id"
    t.integer "user_id"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ride_repeaters", force: :cascade do |t|
    t.integer "ride_id"
    t.integer "ride_frequency_id"
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_rides", force: :cascade do |t|
    t.integer "rider_id"
    t.integer "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "secret_word"
    t.integer "photo_id"
    t.string "gender"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.decimal "pick_up_longitude"
    t.decimal "pick_up_lattitude"
    t.decimal "drop_off_longitude"
    t.decimal "drop_off_lattitude"
    t.integer "user_id"
    t.boolean "is_carpool"
    t.datetime "pick_up_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_photos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_riders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
