require 'rake'
Acres::Application.load_tasks
class AdministrationsController < ApplicationController
    layout "dashboard"

    def backup_database
        Rake::Task['db:dump'].execute
        puts "Resultat de la sauve: #{Rake::Task['db:dump'].execute}"

        
        download_file("#{Rails.root}/db/seeds.rb")

      
    end

    def show_backup
    end

    def download_file(file)
        send_file file, :type => 'text/xml; charset=UTF-8;', :disposition => 'attachment'
      end

    
end