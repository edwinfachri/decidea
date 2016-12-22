# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(first_name: "Decidea",
             last_name: "Admin",
             email: "admin@decidea.com",
             username: "adminn",
             password: "fetishkaki",
             password_confirmation: "fetishkaki",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
User.create!(first_name: "Decidea",
              last_name: "Sub-Admin",
              email: "subadmin@decidea.com",
              username: "subadmin",
              password: "fetishkaki",
              password_confirmation: "fetishkaki",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)

99.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  username = "example#{n+1}"
  email = "example#{n+1}@decidea.com"
  password = "password"
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               username: username,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Category.create!(name: "Graphic Design")
Category.create!(name: "Cinematography")
Category.create!(name: "Photography")
Category.create!(name: "Programming")
Category.create!(name: "Music and Audio")
Category.create!(name: "Business")
Category.create!(name: "Event")

Speciality.create!(name: "Graphic Designer", category_id: 1)
Speciality.create!(name: "Brand Designer", category_id: 1)
Speciality.create!(name: "UI/UX Designer", category_id: 1)
Speciality.create!(name: "3D Animator", category_id: 1)
Speciality.create!(name: "3D Modeler", category_id: 1)
Speciality.create!(name: "3D Renderer", category_id: 1)
Speciality.create!(name: "Drafter", category_id: 1)

Speciality.create!(name: "Cinematorapher", category_id: 2)
Speciality.create!(name: "Director", category_id: 2)
Speciality.create!(name: "Script Writer", category_id: 2)
Speciality.create!(name: "Content Writer", category_id: 2)
Speciality.create!(name: "Talent", category_id: 2)
Speciality.create!(name: "Motion Grapher", category_id: 2)

Speciality.create!(name: "Photographer", category_id: 3)

Speciality.create!(name: "Web Programmer", category_id: 4)

Speciality.create!(name: "Music Editor", category_id: 5)
Speciality.create!(name: "Audio Engineer", category_id: 5)

Location.create!(name: "Denpasar")
Location.create!(name: "Bandung")
Location.create!(name: "Batu")
Location.create!(name: "Bekasi")
Location.create!(name: "Blitar")
Location.create!(name: "Bogor")
Location.create!(name: "Cianjur")
Location.create!(name: "Cilegon")
Location.create!(name: "Cimahi")
Location.create!(name: "Cirebon")
Location.create!(name: "Depok")
Location.create!(name: "West Jakarta")
Location.create!(name: "East Jakarta")
Location.create!(name: "South Jakarta")
Location.create!(name: "North Jakarta")
Location.create!(name: "Central Jakarta")
Location.create!(name: "Madiun")
Location.create!(name: "Magelang")
Location.create!(name: "Malang")
Location.create!(name: "Mojokerto")
Location.create!(name: "Pasuruan")
Location.create!(name: "Pekalongan")
Location.create!(name: "Probolinggo")
Location.create!(name: "Salatiga")
Location.create!(name: "Semarang")
Location.create!(name: "South Tangerang")
Location.create!(name: "Sukabumi")
Location.create!(name: "Surabaya")
Location.create!(name: "Surakarta")
Location.create!(name: "Tasikmalaya")
Location.create!(name: "Tangerang")
Location.create!(name: "Tegal")
Location.create!(name: "Yogyakarta")
Location.create!(name: "Kediri")
Location.create!(name: "Serang")
Location.create!(name: "Purwokerto")
