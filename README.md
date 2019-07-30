# README

# Question 1:
Write a class that takes a string in the format, "12:34 PM", and returns an integer for the number of degrees between the minute hand and the hour hand of the clock. For example, "3:00 PM" should return 90; "6:00 AM" should return 180. The method should return the smaller degree as there are always 2 possible degree values between the hands, so "9:00 AM" should return 90 instead of 270.

#Answer 1:
I have written a ruby document located in `/lib/time-to-angle.rb`. Running this file will ask you to input a value representative of a time. Based on an analog clock, the program will return the angle between the hour hand and minute hand. The angle it provides will not exceed 180 degrees. To run the program from a local terminal, execute the following command:

`ruby lib/time-to-angle.rb`

Example:
`Enter a time:`
`12:34 PM`
`156`

To execute the tests written for this program, execute the following from a local terminal:

`rspec spec/lib/time_to_angle_spec.rb`



#Question 2:
Q2.1: Write out the database schema that you would design for repeating rides. Include table names, column names, column types, and a brief description of each column.
Answer: I have written out my schema in the `/db/schema.rb` file. In this file I have explained the different tables and how they will be used together to accomplish the expected result. Also within this file I have written a brief description of each data base column in each table.

Q2.2: Describe the routes, controller(s), and models you would implement.

Routes:
Add Rider endpoint
`POST /users/:id/riders`  
Remove Rider endpoint
`DELETE /users/:id/riders/:rider_id`
User Profile
`GET /users/:id`
Update Profile
`PATCH /users/:id`
Delete Profile
`DELETE /users/:id`
Rides History
`GET /users/:id/rides`
Ride Details
`GET /users/:id/rides/:ride_id`
Create a Ride
`POST /users/:id/rides`
Update a Ride
`PATCH /users/:id/rides/:ride_id`
Cancel a Ride
`DELETE /users/:id/rides/:ride_id`
Create a repeating ride
`POST /ride_repeaters`
Update ride repeaters (one, many, or all)
`POST /edit_series`
Cancel ride repeaters (one, many, or all)
`DELETE /cancel_series`

Controllers:
#RideRepeaters Controller
Create action - Renders a JSON response with details about created ride repeater
`{
    "ride_repeater": {
        "id": 19,
        "ride_id": 150,
        "ride_frequency_id": 1,
        "name": "Repeater Test Gamma",
        "description": "The third test of the repeater API endpoint",
        "start_date": "2019-08-01T01:17:17.000Z",
        "end_date": "2020-08-01T01:17:17.000Z",
        "created_at": "2019-07-30T21:29:50.479Z",
        "updated_at": "2019-07-30T21:29:50.479Z"
    }
}`

Update action - Renders a JSON response with details about updated repeating rides  
`{
    "message": "Rides updated!",
    "data": [
        [
            {
                "ride": {
                    "id": 177,
                    "user_id": 5,
                    "is_carpool": false,
                    "pick_up_time": "2019-07-30T17:15:18.000Z",
                    "pick_up_longitude": "34.01166",
                    "pick_up_lattitude": "-118.495823",
                    "drop_off_longitude": "34.046798",
                    "drop_off_lattitude": "-118.485013",
                    "created_at": "2019-07-30T01:39:55.011Z",
                    "updated_at": "2019-07-30T21:32:07.514Z"
                },
                "riders": [
                  {
                      "first_name": "Rochelle",
                      "last_name": "Jouan",
                      "secret_word": "stapler",
                      "gender": "female",
                      "age": "9"
                  }
                ]
            }
        ],
        [
            {
                "ride": {
                    "id": 178,
                    "user_id": 5,
                    "is_carpool": true,
                    "pick_up_time": "2019-07-30T17:15:18.000Z",
                    "pick_up_longitude": "34.01166",
                    "pick_up_lattitude": "-118.495823",
                    "drop_off_longitude": "34.046798",
                    "drop_off_lattitude": "-118.485013",
                    "created_at": "2019-07-30T01:39:55.016Z",
                    "updated_at": "2019-07-30T21:32:07.558Z"
                },
                "riders": [
                  {
                      "first_name": "Brad",
                      "last_name": "Shepel",
                      "secret_word": "diamond",
                      "gender": "male",
                      "age": "12"
                  },
                  {
                      "first_name": "Rochelle",
                      "last_name": "Jouan",
                      "secret_word": "stapler",
                      "gender": "female",
                      "age": "9"
                  }
                ]
            }
        ]
    ]
}`

Destroy Action - Renders a JSON response with success message
`{
    "message": "The selected rides have been canceled."
}`


#Users Controller
Show action - Renders a JSON response with the user object
`{
    "user": {
        "id": 3,
        "username": "spotify",
        "email": "ssp@betternature.com",
        "phone_number": "213-867-5309",
        "first_name": "Circadian",
        "last_name": "Rhythm",
        "password_digest": null,
        "created_at": "2019-07-29T20:21:42.534Z",
        "updated_at": "2019-07-29T20:21:42.534Z"
    }
}`

Update action - Renders a JSON response with the user object
`{
    "user": {
        "id": 3,
        "username": "qwerty",
        "phone_number": "111-222-3456",
        "email": "ssp@betternature.com",
        "first_name": "Circadian",
        "last_name": "Rhythm",
        "password_digest": null,
        "created_at": "2019-07-29T20:21:42.534Z",
        "updated_at": "2019-07-30T21:16:22.329Z"
    }
}`

Destroy action - Renders JSON with success message
`{
    "message": "User destroyed"
}`

Add Rider action - Renders JSON response with rider object
`{
    "user_rider": {
        "user_id": 5,
        "rider": {
            "first_name": "Rochelle",
            "last_name": "Jouan",
            "secret_word": "stapler",
            "gender": "female",
            "age": "9"
        }
    }
}`

Remove Rider action - Renders JSON response with success message
`{
    "message": "Rider Removed from Account"
}`

#Rides Controller
Index action - Renders a JSON response with details of all rides for a User
`{
    "data": {
      "user_id": 4,
      "rides": [
        {
            "id": 1,
            "pick_up_longitude": "34.01166",
            "pick_up_lattitude": "-118.495823",
            "drop_off_longitude": "34.046798",
            "drop_off_lattitude": "-118.485013",
            "user_id": 5,
            "is_carpool": false,
            "pick_up_time": "2019-08-01T20:18:51.000Z",
            "created_at": "2019-07-29T20:23:10.629Z",
            "updated_at": "2019-07-29T20:23:10.629Z"
        },
        {
            "id": 2,
            "pick_up_longitude": "34.01166",
            "pick_up_lattitude": "-118.495823",
            "drop_off_longitude": "34.046798",
            "drop_off_lattitude": "-118.485013",
            "user_id": 5,
            "is_carpool": true,
            "pick_up_time": "2019-07-31T20:18:51.000Z",
            "created_at": "2019-07-29T20:23:35.113Z",
            "updated_at": "2019-07-29T20:23:35.113Z"
        }
      ]
    }
}`

Show action - Renders a JSON response with details about one ride
`{
    "data": {
      "user_id": 4,
      "ride": {
          "id": 2,
          "pick_up_longitude": "34.01166",
          "pick_up_lattitude": "-118.495823",
          "drop_off_longitude": "34.046798",
          "drop_off_lattitude": "-118.485013",
          "user_id": 5,
          "is_carpool": true,
          "pick_up_time": "2019-07-31T20:18:51.000Z",
          "created_at": "2019-07-29T20:23:35.113Z",
          "updated_at": "2019-07-29T20:23:35.113Z"
      }
    }
}`

Update action - Renders a JSON response with details of updated ride  
`{
    "ride": {
        "user_id": 5,
        "id": 11,
        "is_carpool": false,
        "pick_up_time": "2019-08-07T20:18:51.000Z",
        "pick_up_longitude": "34.01166",
        "pick_up_lattitude": "-118.495823",
        "drop_off_longitude": "34.046798",
        "drop_off_lattitude": "-118.485013",
        "created_at": "2019-07-29T23:53:52.490Z",
        "updated_at": "2019-07-29T23:57:56.947Z"
    }
}`

Destroy action - Renders a JSON response with a success message  
`{
    "message": "Ride destroyed"
}`

#Models
##User Model

Uniqueness validations
`validates_uniqueness_of :username`
`validates_uniqueness_of :email`
`validates_uniqueness_of :phone_number`
Presence validations
`validates_presence_of :username`
`validates_presence_of :email`
`validates_presence_of :phone_number`
`validates_presence_of :first_name`
`validates_presence_of :last_name`
Length validations
`validates :username, length: { minimum: 5, maximum: 30 }`
`validates :first_name, length: { minimum: 2, maximum: 30 }`
`validates :last_name, length: { minimum: 2, maximum: 30 }`
Relationship associations
`has_many :riders`
`has_many :user_riders`
`has_many :rides
`has_many :ride_repeater_frequencies`

##Rider Model

Uniqueness validations
`validates_presence_of :first_name`
`validates_presence_of :last_name`
`validates_presence_of :secret_word`
`validates_presence_of :gender`
`validates_presence_of :age`
`validates_presence_of :user_id`
Relationship associations
`belongs_to :user`
`belongs_to :user_riders, optional: true`
`has_many :rider_rides, dependent: :destroy`

##Ride Model

Presence validations
`validates_presence_of :pick_up_longitude`
`validates_presence_of :pick_up_lattitude`
`validates_presence_of :drop_off_longitude`
`validates_presence_of :drop_off_lattitude`
`validates_presence_of :user_id`
Relationship associations
`belongs_to :user`
`has_many :rider_rides`
`has_many :user_rides`
`has_many :driver_rides`
`has_many :ride_repeater_frequencies`

## RiderRide Model

Presence validations
`validates_presence_of :rider_id`
`validates_presence_of :ride_id`
Relationship associations
`belongs_to :rider, foreign_key: :rider_id`
`belongs_to :ride, foreign_key: :ride_id`
This method will be used to automatically set up the association for a rider and a ride
It can be used in the create or update action of a Ride or Repeating Ride
`def self.set_ride_for_riders(ride, rider_ids)
  rider_ids.each do |rider|
    RiderRide.find_or_create_by(ride_id: ride.id, rider_id: rider)
  end
end`

##UserRider Model

Presence validations
`validates_presence_of :user_id`
`validates_presence_of :rider_id`
Relationship associations
`belongs_to :user`
`belongs_to :rider`

##RideRepeater Model

Presence validations
`validates_presence_of :ride_id, :ride_frequency_id, :name, :description, :start_date, :end_date`
Relationship associations
`has_and_belongs_to_many :ride_repeater_frequencies`
`has_many :ride_frequencies`
`has_many :rides`
After create method
`after_create :create_repeating_rides`
When a new RideRepeater record is created, this method will automatically evaluate the attributes of the associated
RideFrequency and Ride records to determine how many repeating rides should be created. This does not take into account
the start_date and end_date, it is just a proof of concept for creating weekly and bi-weekly events based off of a
single event. If the frequency is `P0` it means the event is to be repeated each week. If it is `P1` it will be repeated
bi-weekly. We can then set the multiplier accordingly to 1 or 2 respectively. The multiplier is used to set the `pick_up_time` each week or every 2 weeks.
`def create_repeating_rides
  ride_frequency = self.ride_frequency_id.blank? ? nil : RideFrequency.find(self.ride_frequency_id).designation
  ride = self.ride_id.blank? ? nil : Ride.find(self.ride_id)
  frequency = (ride_frequency == "P0") ? 52 : ((ride_frequency == "P1") ? 26 : 0)
  multiplier = (frequency == 52) ? 1 : 2
  frequency.times do |i|
    ride_time = ride.pick_up_time + ((i + 1) * multiplier).weeks
    repeat_ride = Ride.create(pick_up_longitude: ride.pick_up_longitude,
                pick_up_lattitude: ride.pick_up_lattitude,
                drop_off_longitude: ride.drop_off_longitude,
                drop_off_lattitude: ride.drop_off_lattitude,
                user_id: ride.user_id,
                is_carpool: ride.is_carpool,
                pick_up_time: ride.pick_up_time)
    ride_frequency = RideRepeaterFrequency.new(ride_repeater_id: self.id, ride_frequency_id: self.ride_frequency_id, ride_id: repeat_ride.id, user_id: ride.user_id)
    ride_frequency.save!
  end
rescue => e
  # log to service, email admins, return value to trigger response to user
end`

##RideRepeaterFrequency Model

Presence validations
`validates_presence_of :ride_id`
`validates_presence_of :user_id`
`validates_presence_of :ride_repeater_id`
`validates_presence_of :ride_frequency_id`
Relationship associations
`belongs_to :ride_repeater`
`belongs_to :ride_frequency`
`belongs_to :ride`
`belongs_to :user`
`belongs_to :driver, optional: true`
Model method to get all rides matching the IDs in the argument.
`def self.get_series(series_ids)
  select("rides.*")
  .joins("LEFT OUTER JOIN rides ON ride_repeater_frequencies.ride_id = rides.id")
  .where("ride_repeater_frequencies.id IS NOT NULL AND ride_repeater_frequencies.ride_id = ANY(ARRAY[#{series_ids}])")
end`

##RideFrequency Model

Presence validations
`validates_presence_of :designation, :description, :name`

##Driver Model
Presence validations
`validates_presence_of :first_name`
`validates_presence_of :last_name`
`validates_presence_of :age`
`validates_presence_of :gender`
`validates_presence_of :bio`
Length validations
`validates :first_name, length: { minimum: 2, maximum: 30 }`
`validates :last_name, length: { minimum: 2, maximum: 30 }`
Relationship associations
`has_many :driver_rides`
`has_many :driver_photos`
`has_many :driver_cars`
`has_many :rides, through: :driver_rides`
`has_many :cars, through: :driver_cars`
`has_many :ride_repeater_frequencies`

##DriverRide Model

Presence validations
`validates_presence_of :driver_id`
`validates_presence_of :ride_id`
Relationship associations
`belongs_to :driver, foreign_key: :driver_id`
`belongs_to :ride, foreign_key: :ride_id`

##DriverCar Model

Presence validations
`validates_presence_of :driver_id`
`validates_presence_of :car_id`
Relationship associations
`belongs_to :car, foreign_key: :car_id`
`belongs_to :driver, foreign_key: :driver_id`

##Car Model
Presence validations
`validates_presence_of :make, :model, :color, :year, :number_of_seats, :insurance_provider, :registration_year, :registration_month, :registration_expiration, :driver_id`
Relationship associations
`has_one :driver_car`
`belongs_to :driver`
Model method get_valid_car takes driver object as an argument. Looks for the car associated to the driver where
an insurance provider is listed, there is a registration year and month listed and the registration does not expire for 
at least 30 days. This will return the car make, model, color, year, and number of seats available
`def get_valid_car(driver)
  select("cars.make, cars.model, cars.color, cars.year, cars.number_of_seats")
  .where("cars.driver_id = #{driver.id}
    AND (cars.insurance_provider IS NOT NULL
      AND cars.registration_year IS NOT NULL
      AND cars.registration_month IS NOT NULL
      AND cars.registration_expiration IS NOT NULL)
    AND (TO_CHAR((cars.registration_expiration - interval '8 hour'), 'YYYY-MM-DD HH:MI AM PST') > TO_CHAR((NOW() + interval '30 day'), 'YYYY-MM-DD HH:MI AM PST'))")
end`
