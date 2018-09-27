# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
skills = Skill.create(
  [
    {
      name: 'C',
      industry: 'SoftEng'
    },
    {
      name: 'Java',
      industry: 'SoftEng'
    },
    {
      name: 'C++',
      industry: 'SoftEng'
    },
    {
      name: 'Ruby on Rails',
      industry: 'WebDev'
    },
    {
      name: 'Bartender',
      industry: 'Hospitality'
    },
    {
      name: 'Customer Service',
      industry: 'Customer Service'
    }
  ]
)

users = User.create(
  [
    {
      email: 'seeded_user@gmail.com',
      first_name: 'Johnny',
      last_name: 'Userson',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    },
    {
      email: 'seeded_user2@gmail.com',
      first_name: 'Timmy',
      last_name: 'Realuser',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    },
    {
      email: 'legitemployer@gmail.com',
      first_name: 'Joey',
      last_name: 'Gymowner',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    },
    {
      email: 'legitemployer2@gmail.com',
      first_name: 'Mike',
      last_name: 'Usersonson',
      password: 'Password1!',
      password_confirmation: 'Password1!'
    }
  ]
)


employers = EmployerProfile.create(
  [
    {
      user: users[2],
      location: 'Melbourne CBD',
      business_name: 'RMIT University'
    },
    {
      user: users[3],
      location: 'Brunswick',
      business_name: 'NJoeys Gym'
    }
  ]
)

listings = Listing.create(
  [
    {
      title: 'Gym Manager',
      body: 'Need someone to manage my gym',
      published: true,
      accepted: false,
      application: false,
      min_salary: 25.5,
      hours: 'Full Time',
      employer_profile: employers[1],
      skills: [skills[0], skills[1], skills[5]]
    },
    {
      title: 'C# Programmer',
      body: 'Looking to hire a programmer who knows c#',
      published: true,
      accepted: false,
      application: true,
      min_salary: 38.2,
      hours: 'Contract',
      employer_profile: employers[1],
      skills: [skills[0], skills[2]]
    },
    {
      title: 'Kitchen Hand',
      body: 'Looking for an enthusiastic kitchen hand',
      published: true,
      accepted: false,
      application: true,
      min_salary: 15.2,
      hours: 'Part Time',
      employer_profile: employers[0],
      skills: [skills[5], skills[4]]
    }
  ]
)

hunters = HunterProfile.create(
  [
    {
      user: users[0],
      min_salary: 23.7,
      location: 'Melbourne CBD',
      hours: 'Full Time',
      skills: [skills[0], skills[1]],
      listings: [listings[0]]
    },
    {
      user: users[1],
      min_salary: 23.7,
      location: 'Melbourne CBD',
      hours: 'Full Time',
      skills: [skills[0], skills[5], skills[4]],
      listings: [listings[0], listings[1]]
    }
  ]
)
