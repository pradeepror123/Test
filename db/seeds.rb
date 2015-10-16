# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create roles
doctor = Role.create(:name => "doctor")
customer = Role.create(:name => "customer")
receptionist = Role.create(:name => "receptionist")


#create doctors
doctor.users.create!(:name => "Thomas M", username: "thomas", password: "password", password_confirmation: "password")
doctor.users.create!(:name => "Bob", username: "bob", password: "password", password_confirmation: "password")
doctor.users.create!(:name => "Susan", username: "susan", password: "password", password_confirmation: "password")


#create receptionist
receptionist.users.create!(:name => "Cindy Receptionist", username: "cindy", password: "password", password_confirmation: "password")



#create customers
customer.users.create!(:name => "Customer A", username: "customer_a", password: "password", password_confirmation: "password")
customer.users.create!(:name => "Customer B", username: "customer_b", password: "password", password_confirmation: "password")
customer.users.create!(:name => "Customer C", username: "customer_c", password: "password", password_confirmation: "password")
