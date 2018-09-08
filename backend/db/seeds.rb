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
      title: 'Gym Manager',
      body: 'Need someone to manage my gym',
      published: true,
      accepted: false,
      application: false,
      min_salary: 25.5,
      hours: 'Full Time'
    },
    {
      id: 2,
      title: 'C# Programmer',
      body: 'Looking to hire a programmer who knows c#',
      published: true,
      accepted: false,
      application: true,
      min_salary: 19.2,
      hours: 'Contract'
    },
    {
      id: 3,
      title: 'Kitchen Hand',
      body: 'Looking for an enthusiastic kitchen hand',
      published: true,
      accepted: false,
      application: true,
      min_salary: 15.2,
      hours: 'Part Time'
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

Skill.create(
  [
    {
      id: 1,
      name: 'C',
      industry: 'SoftEng'
    },
    {
      id: 2,
      name: 'Java',
      industry: 'SoftEng'
    },
    {
      id: 3,
      name: 'C++',
      industry: 'SoftEng'
    },
    {
      id: 4,
      name: 'Ruby on Rails',
      industry: 'WebDev'
    }
  ]
)
