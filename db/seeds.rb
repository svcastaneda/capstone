# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
f = Faculty.create
User.create(account: f, username: "faculty", email: "faculty@cdm.depaul.edu", password: "password", fname: "Guy", lname: "Fieri")
s = Student.create(major: "CS", concentration: "software engineering", graduation_year: 2017, phone_number: "77735587370", bachelors_origin: "CS", advisor_id: f.id)
User.create(account: s, username: "svcastaneda", email: "svcastaneda@gmail.com", password: "password", fname: "Saundra", lname: "Castaneda")