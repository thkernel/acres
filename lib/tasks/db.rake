namespace :db do

    desc "Dumps the database to db/APP_NAME.dump"
    task :dump => :environment do
        dump_format = 'p'      # or 'c => dump, p => sql', 't => tar', 'd => dir'
        dump_suffix = suffix_for_format(dump_format)
        backup_dir = backup_directory(true)
        cmd = nil
        with_config do |app, host, db, user, password|
            file_name = Time.now.strftime("%Y%m%d%H%M%S") + "_" + db + '.' + dump_suffix
            #cmd = "PGPASSWORD='#{password}' pg_dump -F #{dump_format} -v -h #{host} -d #{db} -f #{backup_dir}/#{file_name}"
            cmd = "PGPASSWORD='#{password}' pg_dump --host #{host} --username #{user} --verbose --clean --no-owner --no-acl --format=c #{db} > #{backup_dir}/#{file_name}"
        end
        puts cmd
        #exec cmd
        system cmd
    end
  
    desc "Restores the database dump at db/APP_NAME.dump."
    task :restore => :environment do
      cmd = nil
      with_config do |app, host, db, user, password|
        cmd = "pg_restore --verbose --host #{host} --username #{user} --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/db/#{app}.dump"
      end
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      puts cmd
      exec cmd
    end
  
    private
  
    def with_config
      yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
    end

    def suffix_for_format suffix
        case suffix
        when 'c' then 'dump'
        when 'p' then 'sql'
        when 't' then 'tar'
        when 'd' then 'dir'
        else nil
        end
    end

    def format_for_file file
        case file
        when /\.dump$/ then 'c'
        when /\.sql$/  then 'p'
        when /\.dir$/  then 'd'
        when /\.tar$/  then 't'
        else nil
        end
    end

    def backup_directory(create=false)
        #backup_dir = "/home/#{ENV['USER']}/acres_backups"
        backup_dir = "#{Rails.root}/db/backups"
        if create and not Dir.exists?(backup_dir)
          puts "Creating #{backup_dir} .."
          FileUtils.mkdir_p(backup_dir)
        end
        backup_dir
    end
  
  end