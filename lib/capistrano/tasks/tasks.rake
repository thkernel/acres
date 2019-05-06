namespace :tasks do
    desc "Excute complementary seeds"
    task :complementary_seed do 
        Role.create(name: "Co-courtier")

    end
end
