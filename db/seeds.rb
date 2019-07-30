# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by(username: "peppermint", email: "curious@original.com", first_name: "Al", last_name: "Toids", phone_number: "(220) 526-0466")
User.find_or_create_by(username: "chewy", email: "pharmacy@cvs.com", first_name: "Alka", last_name: "Seltzer", phone_number: "1-800-245-2898")
User.find_or_create_by(username: "spotify", email: "ssp@betternature.com", first_name: "Circadian", last_name: "Rhythm", phone_number: "213-867-5309")
User.find_or_create_by(username: "torino", email: "olive@pimento.com", first_name: "Martini", last_name: "Rossi", phone_number: "(605) 631-1255")
User.find_or_create_by(username: "calicanadian", email: "ryan.stuhl@gmail.com", first_name: "Ryan", last_name: "Stuhl", phone_number: "(805) 550-8231")


RideFrequency.find_or_create_by(name: "Weekly", description: "Repeat a Ride once a week", designation: "P0")
RideFrequency.find_or_create_by(name: "Bi-Weekly", description: "Repeat a Ride once every other week", designation: "P1")
