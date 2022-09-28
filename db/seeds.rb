# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users_names = [ "sperdomo", "drivera", "toreo" ]

users_names.each do |username|
    User.create(username: username, department: "Human Resources")
end

vacation_end_dates = [ "2022-10-20", "2022-10-21", "2022-10-22" ]

user_id = 1
vacation_end_dates.each do |end_date|
    Vacation.create(start: Date.today, end: end_date, user_id: user_id)
    user_id = user_id+1
end