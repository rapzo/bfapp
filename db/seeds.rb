# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Manager.new(
  email: 'admin@leetapp.net',
  name: 'Bela Flor manager',
  password: 'tassbem'
)

puts admin.save ? "Admin added" : "Admin not added"

manager = Manager.new(
  email: 'manager@leetapp.net',
  name: 'Beatriz Flor',
  password: 'nice'
)

puts manager.save ? "Manager added" : "Manager not added"