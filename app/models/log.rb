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
           
           credit = Credit.new 


           # Begin insert a bank, before to insert bank we check if bank exist
           if row[cell[3]].present?
                unless Customer.exists(row[cell[3]]).present?
                    customer = Customer.new
                    customer.full_name = row[cell[3]]
                    customer.user_id = user.id
                    customer.save
                end
            end


           # Begin insert a bank, before to insert bank we check if bank exist
            if row[cell[4]].present?
                current_bank = Bank.exists(row[cell[4]])
                
                # If bank exist.
                if  current_bank.present? && current_bank.user_id != user.id
                    bank = Bank.new
                    bank.name = row[cell[4]]
                    bank.commission_percentage = 0
                    bank.hypoplus_commission_percentage = 0
                    bank.user_id = user.id
                    bank.save

                elsif !current_bank.present?

                    bank = Bank.new
                    bank.name = row[cell[4]]
                    bank.commission_percentage = 0
                    bank.hypoplus_commission_percentage = 0
                    bank.user_id = user.id
                    bank.save
                end
            end

            # Begin insert a user, before to insert user we check if user exist
            if row[cell[6]].present?
               

                unless User.is_contributor(row[cell[6]], user.id).present?

                    contributor = User.new
                    contributor.full_name = row[cell[6]]
                    contributor.email =  record_count.to_s + "a@exemple.com"
                    contributor.password = '12345678'
                    contributor.password_confirmation = '12345678'
                    #contributor.login = row[cell[6]].delete('').downcase
                    contributor.role = "Apporteur"
                    contributor.created_by = user.id
                    contributor.save

                end
            end

            if row[cell[7]].present?
               

                unless  User.is_producer(row[cell[7]], user.id).present?

                    producer = User.new
                    producer.full_name = row[cell[7]]
                    producer.email = record_count.to_s + "p@exemple.com"
                    producer.password = '12345678'
                    producer.password_confirmation = '12345678'
                    #producer.login = row[cell[7]].delete(' ').downcase
                    producer.role = "Producteur"
                    producer.created_by = user.id
                    producer.save

                end
            end

            if row[cell[8]].present?
                

                unless  Notary.is_notary(row[cell[8]], user.id).present?
                    notary = Notary.new
                    notary.full_name = row[cell[8]]
                    notary.user_id = user.id
                    notary.save

                end
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
