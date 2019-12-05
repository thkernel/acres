require 'rake'
Acres::Application.load_tasks
class AdministrationsController < ApplicationController
    layout "dashboard"

    def backup_database
        #Rake::Task['db:dump'].execute
        puts "Resultat de la sauve: #{Rake::Task['db:dump'].execute}"

        #files = Dir["/home/#{ENV['USER']}/acres_backups/*"]
        files =  Dir["#{Rails.root}/db/backups/*"]
        #download_file("#{Rails.root}/db/seeds.rb")
       
        # Download the last file of the array
        download_file("#{files.last}")

      
         
    end

    def show_backup
    end

    def download_file(file)
        send_file file, :type => 'text/xml; charset=UTF-8;', :disposition => 'attachment'
      end

    
end