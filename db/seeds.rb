# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin Users Manual Login
admin_user = User.create!(
  username: "admin",
  password: "adminpassword",
  role: "admin",
  status: "approved"
)

# Admin Users Google OAuth Login
admin_user2 = User.create!(
  username: "allenrusselldev@gmail.com",
  role: "admin",
  status: "approved"
)

# Users
user1 = User.create!(
  username: "fred",
  password: "password",
  role: "user",
  status: "approved"
)

user1 = User.create!(
  username: "frank",
  password: "password",
  role: "user",
  status: "approved"
)

agent1 = User.create!(
  username: "frida",
  password: "password",
  role: "agent",
  status: "pending",
  description: "I have 2 rooms available for previous offenders"
)

agent2 = User.create!(
  username: "frangelica",
  password: "password",
  role: "agent",
  status: "pending",
  description: "I own a group home and accept vouchers"
)