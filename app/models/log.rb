class Log < ApplicationRecord
    require 'creek'
    belongs_to :user

    def self.import(file)
        #file = params[:file]
        creek =  Creek::Book.new(file.path, check_file_extension: false)
        sheet = creek.sheets[0]
    
        sheet.rows.each do |row|
            puts row # => {"A1"=>"Content 1", "B1"=>nil, C1"=>nil, "D1"=>"Content 3"}
        end
    
      end

end
