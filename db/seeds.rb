# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Cat.create!(name: "Jim", color: "black", sex: "M", description: "Cool cat",
  user_id: 1, birth_date: "1/1/2012")

Cat.create!(name: "Taco", color: "orange", sex: "M", description: "mexican cat",
  user_id: 1, birth_date: "1/1/2013")

Cat.create!(name: "Catdog", color: "white", sex: "F", description: "Weird cat",
  user_id: 2, birth_date: "1/1/2014")
