# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Manager.create([{
  email: 'admin@leetapp.net',
  name: 'Bela Flor manager',
  password: 'tassbem'
}])

puts admin ? "Admin added" : "Admin not added"

manager = Manager.create([{
  email: 'manager@leetapp.net',
  name: 'Beatriz Flor',
  password: 'nice'
}])

puts manager ? "Manager added" : "Manager not added"