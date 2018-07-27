class Log < ApplicationRecord
    require 'creek'
    belongs_to :user

    validates_presence_of :file_name

    def self.import?(file, user)
         # But before import in database, we delete all data in our model
         Credit.delete_all#(user_id: user.id) #if Credit.find_by(user_id: user.id).present?

        # Opening file
        creek = Creek::Book.new(file.path)

        # Getting the first sheet
        sheet = creek.sheets[0]

        record_count = 0
        # Loop all sheet rows
        sheet.rows.each do |row|
            # The row return a hash, we save all Hash key in a new Array
           cell = row.keys

           # Insert the line in database,
           #user = User.new
           bank = Bank.new
           credit = Credit.new   
           # Begin insert a bank, before to insert bank we check if bank exist
           unless Bank.exists(row[cell[4]]).present?
                bank.name = row[cell[4]]
                bank.user_id =
                bank.save
           end

           credit.credit_id = row[cell[0]]
           credit.production_date = row[cell[1]]
           credit.acte_date = row[cell[2]]
           credit.customer_name = row[cell[3]]
           credit.bank_name = row[cell[4]]
           credit.amount = row[cell[5]]
           credit.contributor_name = row[cell[6]]
           credit.producer_name = row[cell[7]]
           credit.notary_name = row[cell[8]]
           credit.hypoplus = row[cell[9]]
           credit.user_id = user.id 
           credit.save
           # End saving
           record_count += 1
        end   

        log = Log.new
        log.file_name = file.original_filename
        log.no_record = record_count
        log.error = "Non"
        log.status = true
        log.user_id = user.id
        log.save
        return true
    end

    #has_attached_file :file_name
    #validates_attachment :file_name, presence: true

end
