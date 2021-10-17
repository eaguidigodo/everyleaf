# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
I18n.reload!
name = Faker::Name.name
email = Faker::Internet.email
password = "passwordlongshort"
User.create!(username: name,
             email: email,
             password: password,
             password_confirmation: password,
             is_admin: false
             )

User.create!(username: "admin",
            email: "admin@admin.com",
            password: "adminpass",
            password_confirmation: "adminpass",
            is_admin: true
            )
