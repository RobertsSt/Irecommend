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
    password: 'password',
    username: 'admin',
    name: 'administrators',
    admin: true
  )
  puts "  - User #{u.email} created"

end
puts '- Creating categories'
c = Category.create!(name: 'Cita')
c = Category.create!(name: 'Vietas')
c = Category.create!(name: 'Filmas')
c = Category.create!(name: 'Izklaide')
c = Category.create!(name: 'Ētika')
c = Category.create!(name: 'Ēdiens')
c = Category.create!(name: 'Sports')
c = Category.create!(name: 'Zinātne')
c = Category.create!(name: 'Mūzika')
c = Category.create!(name: 'Literatūra')
puts '- Categories created'
