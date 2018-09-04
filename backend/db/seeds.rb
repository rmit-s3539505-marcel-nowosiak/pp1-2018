# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create(
  [
    {
      id: 1,
      email: 'seeded_user@gmail.com',
      first_name: 'User',
      last_name: 'Userson',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    },
    {
      id: 2,
      email: 'seeded_user2@gmail.com',
      first_name: 'User2',
      last_name: 'Userson',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    }
  ]
)

Listing.create(
  [

    {
      id: 1,
      title: 'First listing',
      body: 'Some more info regarding the listing',
      published: true,
      accepted: false,
      application: false
    },
    {
      id: 2,
      title: 'Second listing',
      body: 'Some more info regarding the listing',
      published: true,
      accepted: false,
      application: true
    },
    {
      id: 3,
      title: 'Third listing',
      body: 'Some more info regarding the listing',
      published: true,
      accepted: false,
      application: true
    }
  ]
)

HunterProfile.create(
  [
    {
      id: 1,
      user_id: 1,
      min_salary: 23.7,
      location: 'Melbourne CBD',
      hours: 'Full Time'
    },
    {
      id: 2,
      user_id: 2,
      min_salary: 23.7,
      location: 'Melbourne CBD',
      hours: 'Full Time'
    }
  ]
)

EmployerProfile.create(
  [
    {
      id: 1,
      user_id:  1,
      location: 'Melbourne CBD',
      business_name: 'RMIT University'
    }
  ]
)

Match.create(
  [
    {
      id: 1,
      offered: true,
      accepted: false,
      application: false,
      hunterprofile_id: 1,
      listing_id: 1
    },
    {
      id: 2,
      offered: true,
      accepted: false,
      application: false,
      hunterprofile_id: 1,
      listing_id: 2
    },
    {
      id: 3,
      offered: true,
      accepted: false,
      application: false,
      hunterprofile_id: 2,
      listing_id: 2
    }
  ]
)
