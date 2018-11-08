# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Morty', last_name: 'Smith', password: 'Test12345!', email: 'jbell.mn@gmail.com', activated: true, activated_at: Time.now)
User.create(first_name: 'Rick', last_name: 'Sanchez', password: 'Test12345!', email: 'jordanmbell@nocoathletics.com', activated: true, activated_at: Time.now)
