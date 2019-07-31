# README

**Question 1:**

Write a class that takes a string in the format, "12:34 PM", and returns an integer for the number of degrees between the minute hand and the hour hand of the clock. For example, "3:00 PM" should return 90; "6:00 AM" should return 180. The method should return the smaller degree as there are always 2 possible degree values between the hands, so "9:00 AM" should return 90 instead of 270.

**Answer 1:**

I have written a ruby document located in ``/lib/time-to-angle.rb``. Running this file will ask you to input a value representative of a time. Based on an analog clock, the program will return the angle between the hour hand and minute hand. The angle it provides will not exceed 180 degrees. To run the program from a local terminal, execute the following command:

``ruby lib/time-to-angle.rb``

Example:
``Enter a time:``

``12:34 PM``

``156``

To execute the tests written for this program, execute the following from a local terminal:

``rspec spec/lib/time_to_angle_spec.rb``



**Question 2:**

***Q2.1:*** 

Write out the database schema that you would design for repeating rides. Include table names, column names, column types, and a brief description of each column.

***Answer:*** 

I have written out my schema in the ``/db/schema.rb`` file. In this file I have explained the different tables and how they will be used together to accomplish the expected result. Also within this file I have written a brief description of each data base column in each table.

***Q2.2:*** 

Describe the routes, controller(s), and models you would implement.

**Routes:**

Add Rider endpoint

``POST /users/:id/riders``

Remove Rider endpoint

``DELETE /users/:id/riders/:rider_id``

User Profile

``GET /users/:id``

Update Profile

``PATCH /users/:id``

Delete Profile

``DELETE /users/:id``

Rides History

``GET /users/:id/rides``

Ride Details

``GET /users/:id/rides/:ride_id``

Create a Ride

``POST /users/:id/rides``

Update a Ride

``PATCH /users/:id/rides/:ride_id``

Cancel a Ride

``DELETE /users/:id/rides/:ride_id``

Create a repeating ride

``POST /ride_repeaters``

Update ride repeaters (one, many, or all)

``POST /edit_series``

Cancel ride repeaters (one, many, or all)

``DELETE /cancel_series``


**Controllers:**

***RideRepeaters Controller***

Create action - Renders a JSON response with details about created ride repeater

```json
{
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
}
```


Update action - Renders a JSON response with details about updated repeating rides  

```json
{
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
}
```

Destroy Action - Renders a JSON response with success message

```json
{
    "message": "The selected rides have been canceled."
}
```


***Users Controller***

Show action - Renders a JSON response with the user object

```json
{
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
}
```

Update action - Renders a JSON response with the user object

```json
{
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
}
```

Destroy action - Renders JSON with success message

```json 
{
    "message": "User destroyed"
}
```

Add Rider action - Renders JSON response with rider object

```json
{
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
}
```

Remove Rider action - Renders JSON response with success message

```json
{
    "message": "Rider Removed from Account"
}
```

***Rides Controller***

Index action - Renders a JSON response with details of all rides for a User

```json
{
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
}
```

Show action - Renders a JSON response with details about one ride

```json
{
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
}
```

Create action - Renders a JSON response with details of the new Ride.

```json
{
    "data": {
        "user_id": 5,
        "ride": {
            "id": 279,
            "pick_up_longitude": "34.01166",
            "pick_up_lattitude": "-118.495823",
            "drop_off_longitude": "34.046798",
            "drop_off_lattitude": "-118.485013",
            "user_id": 5,
            "is_carpool": false,
            "pick_up_time": "2019-08-01T20:18:51.000Z",
            "created_at": "2019-07-30T22:45:33.465Z",
            "updated_at": "2019-07-30T22:45:33.465Z"
        }
    }
}
```

Update action - Renders a JSON response with details of updated ride  

```json
{
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
}
```

Destroy action - Renders a JSON response with a success message  

```json
{
    "message": "Ride destroyed"
}
```

**Models**

***User Model***

Uniqueness validations

``validates_uniqueness_of :username``
``validates_uniqueness_of :email``
``validates_uniqueness_of :phone_number``

Presence validations

``validates_presence_of :username``
``validates_presence_of :email``
``validates_presence_of :phone_number``
``validates_presence_of :first_name``
``validates_presence_of :last_name``

Length validations

``validates :username, length: { minimum: 5, maximum: 30 }``
``validates :first_name, length: { minimum: 2, maximum: 30 }``
``validates :last_name, length: { minimum: 2, maximum: 30 }``

Relationship associations

``has_many :riders``
``has_many :user_riders``
``has_many :rides``
``has_many :ride_repeater_frequencies``

***Rider Model***

Uniqueness validations

``validates_presence_of :first_name``
``validates_presence_of :last_name``
``validates_presence_of :secret_word``
``validates_presence_of :gender``
``validates_presence_of :age``
``validates_presence_of :user_id``

Relationship associations

``belongs_to :user``
``belongs_to :user_riders, optional: true``
``has_many :rider_rides, dependent: :destroy``

***Ride Model***

Presence validations

``validates_presence_of :pick_up_longitude``
``validates_presence_of :pick_up_lattitude``
``validates_presence_of :drop_off_longitude``
``validates_presence_of :drop_off_lattitude``
``validates_presence_of :user_id``

Relationship associations

``belongs_to :user``
``has_many :rider_rides``
``has_many :user_rides``
``has_many :driver_rides``
``has_many :ride_repeater_frequencies``

*** RiderRide Model***

Presence validations

``validates_presence_of :rider_id``
``validates_presence_of :ride_id``

Relationship associations

``belongs_to :rider, foreign_key: :rider_id``
``belongs_to :ride, foreign_key: :ride_id``

This method will be used to automatically set up the association for a rider and a ride
It can be used in the create or update action of a Ride or Repeating Ride

```json
def self.set_ride_for_riders(ride, rider_ids)
  rider_ids.each do |rider|
    RiderRide.find_or_create_by(ride_id: ride.id, rider_id: rider)
  end
end
```

***UserRider Model***

Presence validations

``validates_presence_of :user_id``
``validates_presence_of :rider_id``

Relationship associations

``belongs_to :user``
``belongs_to :rider``

***RideRepeater Model

Presence validations

``validates_presence_of :ride_id, :ride_frequency_id, :name, :description, :start_date, :end_date``

Relationship associations

``has_and_belongs_to_many :ride_repeater_frequencies``
``has_many :ride_frequencies``
``has_many :rides``

After create method

``after_create :create_repeating_rides``

When a new RideRepeater record is created, this method will automatically evaluate the attributes of the associated
RideFrequency and Ride records to determine how many repeating rides should be created. This does not take into account
the start_date and end_date, it is just a proof of concept for creating weekly and bi-weekly events based off of a
single event. If the frequency is ``P0`` it means the event is to be repeated each week. If it is ``P1`` it will be repeated
bi-weekly. We can then set the multiplier accordingly to 1 or 2 respectively. The multiplier is used to set the ``pick_up_time`` each week or every 2 weeks.

```json
def create_repeating_rides
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
end
```

***RideRepeaterFrequency Model***

Presence validations

``validates_presence_of :ride_id``
``validates_presence_of :user_id``
``validates_presence_of :ride_repeater_id``
``validates_presence_of :ride_frequency_id``

Relationship associations

``belongs_to :ride_repeater``
``belongs_to :ride_frequency``
``belongs_to :ride``
``belongs_to :user``
``belongs_to :driver, optional: true``

Model method to get all rides matching the IDs in the argument.

```json
def self.get_series(series_ids)
  select("rides.*")
  .joins("LEFT OUTER JOIN rides ON ride_repeater_frequencies.ride_id = rides.id")
  .where("ride_repeater_frequencies.id IS NOT NULL AND ride_repeater_frequencies.ride_id = ANY(ARRAY[#{series_ids}])")
end
```

***RideFrequency Model***

Presence validations

``validates_presence_of :designation, :description, :name``

***Driver Model***

Presence validations

``validates_presence_of :first_name``
``validates_presence_of :last_name``
``validates_presence_of :age``
``validates_presence_of :gender``
``validates_presence_of :bio``

Length validations

``validates :first_name, length: { minimum: 2, maximum: 30 }``
``validates :last_name, length: { minimum: 2, maximum: 30 }``

Relationship associations

``has_many :driver_rides``
``has_many :driver_photos``
``has_many :driver_cars``
``has_many :rides, through: :driver_rides``
``has_many :cars, through: :driver_cars``
``has_many :ride_repeater_frequencies``

***DriverRide Model***

Presence validations

``validates_presence_of :driver_id``
``validates_presence_of :ride_id``

Relationship associations

``belongs_to :driver, foreign_key: :driver_id``
``belongs_to :ride, foreign_key: :ride_id``

***DriverCar Model***

Presence validations

``validates_presence_of :driver_id``
``validates_presence_of :car_id``

Relationship associations

``belongs_to :car, foreign_key: :car_id``
``belongs_to :driver, foreign_key: :driver_id``

***Car Model***

Presence validations

``validates_presence_of :make, :model, :color, :year, :number_of_seats, :insurance_provider, :registration_year, :registration_month, :registration_expiration, :driver_id``

Relationship associations

``has_one :driver_car``
``belongs_to :driver``

Model method get_valid_car takes driver object as an argument. Looks for the car associated to the driver where
an insurance provider is listed, there is a registration year and month listed and the registration does not expire for
at least 30 days. This will return the car make, model, color, year, and number of seats available

```json
def get_valid_car(driver)
  select("cars.make, cars.model, cars.color, cars.year, cars.number_of_seats")
  .where("cars.driver_id = #{driver.id}
    AND (cars.insurance_provider IS NOT NULL
      AND cars.registration_year IS NOT NULL
      AND cars.registration_month IS NOT NULL
      AND cars.registration_expiration IS NOT NULL)
    AND (TO_CHAR((cars.registration_expiration - interval '8 hour'), 'YYYY-MM-DD HH:MI AM PST') > TO_CHAR((NOW() + interval '30 day'), 'YYYY-MM-DD HH:MI AM PST'))")
end
```

Q2.3: Write request/response documentation for how a mobile client might create, edit, and cancel a set of repeating rides.

Answer:

Step 1: Add a Ride

```json
curl --location --request POST "http://localhost:3000/users/5/rides?ride%5Bpick_up_longitude%5D=34.011660&ride%5Bpick_up_lattitude%5D=-118.495823&ride%5Bdrop_off_longitude%5D=34.046798&ride%5Bdrop_off_lattitude%5D=-118.485013&ride%5Bis_carpool%5D=false&ride%5Bpick_up_time%5D=Thu,%201%20Aug%202019%2013:18:51%20-0700&riders=%5B2%5D"
```
Request Method: POST

PARAMS

``ride[pick_up_longitude]       34.011660``
``ride[pick_up_lattitude]       -118.495823``
``ride[drop_off_longitude]      34.046798``
``ride[drop_off_lattitude]      -118.485013``
``ride[is_carpool]              false``
``ride[pick_up_time]            Thu, 1 Aug 2019 13:18:51 -0700``
``riders[2]``

Response:

```json
{
    "data": {
        "user_id": 5,
        "ride": {
            "id": 279,
            "pick_up_longitude": "34.01166",
            "pick_up_lattitude": "-118.495823",
            "drop_off_longitude": "34.046798",
            "drop_off_lattitude": "-118.485013",
            "user_id": 5,
            "is_carpool": false,
            "pick_up_time": "2019-08-01T20:18:51.000Z",
            "created_at": "2019-07-30T22:45:33.465Z",
            "updated_at": "2019-07-30T22:45:33.465Z"
        }
    }
}
```

The create action calls the ``set_ride_for_rider`` method on the ``RiderRide`` model passing in the ``@ride`` instance variable and the ids of the ``riders`` parameter as arguements.

Step 2: Create Repeating Rides

```json
curl --location --request POST "http://localhost:3000/ride_repeaters?ride_repeater%5Bride_id%5D=13&ride_repeater%5Bride_frequency_id%5D=1&ride_repeater%5Bname%5D=Repeater%20Test%20Gamma&ride_repeater%5Bdescription%5D=The%20third%20test%20of%20the%20repeater%20API%20endpoint&ride_repeater%5Bstart_date%5D=Wed,%2031%20Jul%202019%2018:17:17%20-0700&ride_repeater%5Bend_date%5D=Fri,%2031%20Jul%202020%2018:17:17%20-0700"
```

Request Method: POST

PARAMS

``ride_repeater[ride_id]            13``
``ride_repeater[ride_frequency_id]  1``
``ride_repeater[name]               Repeater Test Alpha``
``ride_repeater[description]        The first test of the repeater API endpoint``
``ride_repeater[start_date]         Wed, 31 Jul 2019 18:17:17 -0700``
``ride_repeater[end_date]           Fri, 31 Jul 2020 18:17:17 -0700``

Response:

```json
{
    "ride_repeater": {
        "id": 20,
        "ride_id": 150,
        "ride_frequency_id": 1,
        "name": "Repeater Test Gamma",
        "description": "The third test of the repeater API endpoint",
        "start_date": "2019-08-01T01:17:17.000Z",
        "end_date": "2020-08-01T01:17:17.000Z",
        "created_at": "2019-07-30T22:52:39.619Z",
        "updated_at": "2019-07-30T22:52:39.619Z"
    }
}
```

The ``RideRepeater`` Model has an after create method to create the repeating rides based on the ``RideFrequency`` ID referenced in the parameters.

Step 3: Update Repeating Rides

```json
curl --location --request POST "http://localhost:3000/edit_series?series=%5B182,183,184,185%5D&is_carpool=true&pick_up_time=Tue,%2030%20Jul%202019%2010:15:18%20-0700&user_id=5"
```

Request Method: POST

PARAMS

``series                          [182,183,184,185]``
``is_carpool                      true``
``pick_up_time                    Tue, 30 Jul 2019 10:15:18 -0700``
``user_id                         5``

Response:

```json
{
    "message": "Rides updated!",
    "data": [
        [
            {
                "ride": {
                    "id": 182,
                    "user_id": 5,
                    "is_carpool": true,
                    "pick_up_time": "2019-07-30T17:15:18.000Z",
                    "pick_up_longitude": "34.01166",
                    "pick_up_lattitude": "-118.495823",
                    "drop_off_longitude": "34.046798",
                    "drop_off_lattitude": "-118.485013",
                    "created_at": "2019-07-30T01:39:55.011Z",
                    "updated_at": "2019-07-30T21:32:07.514Z"
                },
                "riders": null
            }
        ],
        [
            {
                "ride": {
                    "id": 183,
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
                "riders": null
            }
        ],
        [
            {
                "ride": {
                    "id": 184,
                    "user_id": 5,
                    "is_carpool": true,
                    "pick_up_time": "2019-07-30T17:15:18.000Z",
                    "pick_up_longitude": "34.01166",
                    "pick_up_lattitude": "-118.495823",
                    "drop_off_longitude": "34.046798",
                    "drop_off_lattitude": "-118.485013",
                    "created_at": "2019-07-30T01:39:55.021Z",
                    "updated_at": "2019-07-30T21:32:07.562Z"
                },
                "riders": null
            }
        ],
        [
            {
                "ride": {
                    "id": 185,
                    "user_id": 5,
                    "is_carpool": true,
                    "pick_up_time": "2019-07-30T17:15:18.000Z",
                    "pick_up_longitude": "34.01166",
                    "pick_up_lattitude": "-118.495823",
                    "drop_off_longitude": "34.046798",
                    "drop_off_lattitude": "-118.485013",
                    "created_at": "2019-07-30T01:39:55.026Z",
                    "updated_at": "2019-07-30T21:32:07.565Z"
                },
                "riders": null
            }
        ]
    ]
}
```

In a before action the ``RideRepeatersController`` ``get_series_for_edit`` action calls the ``get_series`` method on ``RideRepeaterFrequency`` model, passing in the ride IDs as an argument. The collection is then used to look up each ride object and update the parameters passed in the request on each ride uniformly.

Step 4: Cancel Repeating Rides

```json
curl --location --request DELETE "http://localhost:3000/cancel_series?series=%5B182,%20187,%20184,%20183%5D"
```

Request Method: DELETE

PARAMS

``series                        [182, 183, 184, 185]``

In a before action the ``RideRepeatersController`` ``cancel_series`` action calls the ``get_series`` method on ``RideRepeaterFrequency`` model, passing in the ride IDs from the ``series`` parameter in the request. It then looks up each ``Ride`` with the information returned in the collection and destroys the ``Ride`` record.


Q2.4: Provide edge cases and how you would test them

Answer:

Creating Repeating Rides: The method would need to be updated initially to accept a date range. Then it would need to calculate the number of weeks between the start date and the end date so it will only create the necessary number of rides based on the available number of weeks in the range. Otherwise it is going to assume that the rides should repeat for a total of 1 year.

***How to test:***

Write tests that set the start and end dates in the range at the beginning of the month and end of the month. Expect the number of weeks to equal 4. Expect the number of Rides increased by 4 unless the repeating frequency is bi-weekly, then it should only increase by 2.

What happens if there is already a ride scheduled for a day and time that falls in a repeating series? Obviously this should silently fail and possibly notify the user via an email message.

***How to test:***

We should expect that if a repeating ride is set up on a Wednesday for weekly repetition, if the same ride is used for bi-weekly repetition, it should not save the second set of repeating rides, and instead return a message to the user indicating that there are already rides scheduled on their account that conflict with the recently requested rides.

Editing Repeating Rides:
User error could cause unwanted consequences. A user could edit a ride and accidentally set the pick up or drop off point to an undesired location. We should have historical records kept of rides for their lifecycle.

***How to test:***

Set up an archiving system for Rides. When a ride is updated, it should instead duplicate and archive the original. This way if a user were to unintentionally edit a ride or repeating ride, they could easily revert their changes.

Cancelling Repeating Rides:
Similar to the problem with Editing Rides, if we create an archiving system, users could delete and revive rides and repeating rides. This way if they unintentionally destroy an entire repeating ride schedule, it would not be difficult for them to restore the repeating rides on their own.


Q2.5: Provide performance challenges and how you would address them

Answer:

***Hardware***

- The number one factor to consider is Signal Strength. The application would need some sort of offline support so that in the event that the user loses signal, their changes will be stored in memory until they are back in a strong signal area.

***Memory and Garbage Collection***

- The number two issue would be memory and garbage collection. Looking up and storing cached collections of data would fill up the available memory quickly. Precautions would need to be taken to ensure that the level of used up memory doesn't scale quickly.

***Accumulation***

- As users continue to use the system, they will accumulate more historical data. If we attempt to display too much of the historical data to the user, they will have a bad experience. All data should be retrieved in an on-demand basis. Using a front end framework like React, Vue, or Angular would allow for small packets of data to be requested often rather than large collections of data retrieved at once. Pagination would also help cut down on the size of data to be retrieved and displayed.

***Response Bloat***

- The use of intelligently structured SQL queries (or PostgreSQL queries) would return only the data necessary for consumption. In addition the use of Serializers in the responses from the API endpoints would cut down on response bloat. For example, if we are looking up the pick up, drop off locations and the pick up time, we obviously don't need to know about when the record was created or updated last.  
