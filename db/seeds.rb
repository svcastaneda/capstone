# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cs = Degree.create(name: "Computer Science", num_intro: 6, num_foundation: 5, num_advanced: 0, num_major_electives: 8, num_open_electives: 0)
is1 = Degree.create(name: "IS - Business Analysis/Systems Analysis", num_intro: 0, num_foundation: 4, num_advanced: 5, num_major_electives: 2, num_open_electives: 1)
is2 = Degree.create(name: "IS - Business Intelligence", num_intro: 2, num_foundation: 4, num_advanced: 4, num_major_electives: 3, num_open_electives: 1)
is3 = Degree.create(name: "IS - Database Administration", num_intro: 1, num_foundation: 4, num_advanced: 4, num_major_electives: 3, num_open_electives: 1)
is4 = Degree.create(name: "IS - IT Enterprise Management", num_intro: 0, num_foundation: 4, num_advanced: 4, num_major_electives: 3, num_open_electives: 1)
is5 = Degree.create(name: "IS - Standard", num_intro: 0, num_foundation: 4, num_advanced: 0, num_major_electives: 7, num_open_electives: 1)

a = User.create(account_type: "Admin", username: "admin", email: "admin@cdm.depaul.edu", password: "password", fname: "Admin", lname: "Admin")

f = User.create(account_type: "Faculty", username: "faculty", email: "faculty@cdm.depaul.edu", password: "password", fname: "Guy", lname: "Fieri")
f2 = User.create(account_type: "Faculty", username: "nic", email: "declarationof@independen.ce", password: "password", fname: "Nic", lname: "Cage")

s = Student.create(id: 1234567, degree_id: cs.id, advisor_id: f.id)
User.create(id: s.id, account_type: "Student", username: "svcastaneda", email: "svcastaneda@gmail.com", password: "password", fname: "Saundra", lname: "Castaneda")
s = Student.create(id: 1234, degree_id: is1.id, advisor_id: f2.id)
User.create(id: s.id, account_type: "Student", username: "oliver", email: "oliver@gmail.com", password: "password", fname: "Ayala", lname: "Ayala")