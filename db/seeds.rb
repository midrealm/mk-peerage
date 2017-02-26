# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Specialty.create([{name: 'Music'}, {name: 'Costuming'}, {name: 'Earwax Studies'}])

  nique = User.create do |u|
    u.email = 'nique.rio@gmail.com'
    u.password = 'password' 
    u.sca_name = 'Jadwiga Kryzanowska'
    u.modern_name = 'Monique Rio'
    u.street = '1430 Pontiac Trail'
    u.city = 'Ann Arbor'
    u.state = 'MI'
    u.zipcode = '48105'
    u.phone = '5865495224'
    u.deceased = false
    u.active = true
    u.elevation_date = nil
    u.vigilant = false
  end
  Specialization.create(user: nique, specialty: Specialty.find_by(name: 'Music'))

  vig = User.create do |u|
    u.email = 'example@blah.com'
    u.password = Devise.friendly_token.first(8)  
    u.sca_name = 'Joe Vigilant'
    u.active = true
    u.vigilant = true
  end
  inactive = User.create do |u|
    u.email = 'example2@blah.com'
    u.password = Devise.friendly_token.first(8)  
    u.sca_name = 'Jane Inactive'
    u.active = false
    u.vigilant = false
  end
  Specialization.create(user: inactive, specialty: Specialty.find_by(name: 'Costuming'))
  Specialization.create(user: inactive, specialty: Specialty.find_by(name: 'Music'))
  dead = User.create do |u|
    u.email = 'example3@blah.com'
    u.password = Devise.friendly_token.first(8)  
    u.sca_name = 'Alex Deceased'
    u.active = false
    u.vigilant = false
    u.deceased = true
  end
  Specialization.create(user: dead, specialty: Specialty.find_by(name: 'Earwax Studies'))
  Specialization.create(user: dead, specialty: Specialty.find_by(name: 'Costuming'))
  Specialization.create(user: dead, specialty: Specialty.find_by(name: 'Music'))
