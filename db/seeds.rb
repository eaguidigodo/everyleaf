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

10.times do |n|
    name = Faker::Games::Pokemon.name
    email = Faker::Internet.email
    password = "userpassword"
    User.create!(username: name,
                email: email,
                password: password,
                password_confirmation: password,
                is_admin: false
                )
end

5.times do |n|
    name = Faker::JapaneseMedia::Naruto.character
    Task.create!(name: name,
                detail: "New york",
                deadline: Date.today,
                status: "completed",
                priority: "Low",
                all_tags: "new, old, nice, out, red, color",
                user_id: 1
                )
end

2.times do |n|
    name = Faker::JapaneseMedia::Naruto.village
    Task.create!(name: name,
                detail: "anti social",
                deadline: Date.today,
                status: "completed",
                priority: "Low",
                all_tags: "yellow, blue",
                user_id: 1
                )
end


    name = Faker::JapaneseMedia::Naruto.eye
    Task.create!(name: name,
                detail: "New tak",
                deadline: Date.today,
                status: "completed",
                priority: "Low",
                all_tags: "sad, happy, big, tall, small, done",
                user_id: 1
                )

name = Faker::JapaneseMedia::Naruto.demon
    Task.create!(name: name,
                detail: "New tak",
                deadline: Date.today,
                status: "completed",
                priority: "Low",
                all_tags: "black, winner, good, bad",
                user_id: 1
                )
