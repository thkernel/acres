# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Add initial users in database.
#User.create(full_name: "ACRES",  role: "Admin", email: "phn@acres.be", password: "root2018",
    #password_confirmation: "root2018")

    #User.create(full_name: "Yves LEULIER",  role: "Superadmin", email: "yves.leulier@cosmopol.be", password: "root2018",
        #password_confirmation: "root2018")

        
# Add initial role in database.
unless Role.all.present?
    roles = Role.create([
        {name: "Superadmin"}, 
        {name: "Admin"},
        {name: "Producteur"},
        {name: "Co-courtier"},
        {name: "Apporteur"}
    ])
else
    roles = Role.all

end



# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback
