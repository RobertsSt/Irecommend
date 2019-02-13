# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '- Creating users'
if u = User.where(email: 'admin@email.com').first
  puts "  - User #{u.email} already exists"
else
  u = User.create!(
    email: 'admin@email.com',
    password: 'password123',
    username: 'administrator',
    name: 'Roberts Šteins'
  )
  puts "  - User #{u.email} created"
end
