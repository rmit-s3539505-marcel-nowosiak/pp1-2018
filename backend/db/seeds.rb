# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create(
  {
    id: 1,
    email: 'seeded_user@gmail.com',
    first_name: 'Seeded',
    last_name: 'User',
    password: 'Password1!',
    password_confirmation: 'Password1!'
  }
)

Listing.create(
  {
    id: 1,
    title: 'First listing',
    body: 'Some more info regarding the listing',
    published: true
  }
)

HunterProfile.create(
  {
    id: 1,
    user_id: 1,
    min_salary: 23.7,
    location: 'Melbourne CBD',
    hours: 'Full Time',
    listings: Listing.where(id: 1)
  }
)

EmployerProfile.create(
  {
    id: 1,
    user_id:  1,
    location: 'Melbourne CBD',
    business_name: 'RMIT University'
  }
)
