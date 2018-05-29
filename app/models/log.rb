class Log < ApplicationRecord
    require 'roo'
    require 'creek'
    belongs_to :user

    def self.import(file, user)
        creek = Creek::Book.new(file)
        sheet = creek.sheets[0]

        i = 2
        sheet.rows.each do |row|
            a = "A" + i.to_s
            puts row[a]
            puts "=================================="
            i = i + 1
        end   
    end

    has_attached_file :file_name
    validates_attachment :file_name, presence: true

end
