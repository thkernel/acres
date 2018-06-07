# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Add initial users in database.
User.create(first_name: "ACRES", last_name: "ADMIN" , role: "Admin", email: "phn@acres.be", password: "root2018",
    password_confirmation: "root2018")

    User.create(first_name: "Yves", last_name: "LEULIER" , role: "Superadmin", email: "yves.leulier@cosmopol.be", password: "root2018",
        password_confirmation: "root2018")

        
# Add initial role in database.
Role.create(name: "Superadmin")
Role.create(name: "Admin")
Role.create(name: "Producteur")
Role.create(name: "Apporteur")