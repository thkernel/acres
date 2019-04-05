class Log < ApplicationRecord
    require 'creek'
    belongs_to :user

    validates_presence_of :file_name

    def self.import?(file, user)
         # But before import in database, we delete all data in our model
         #Credit.delete_all#(user_id: user.id) #if Credit.find_by(user_id: user.id).present?
        Credit.destroy_all
        
        # Opening file
        creek = Creek::Book.new(file.path)
        puts "File path: #{file.path}"

        company = Company.first
        company = company.name.downcase if company
        
        
        # Getting the first sheet
        sheet = creek.sheets[0]


        record_count = 0
        # Loop all sheet rows
        puts "Je compte: #{sheet.rows.count}"
        puts "Feuille: #{sheet}"

        current_credit = nil

        if company
            sheet.rows.each_with_index do |row, index|
                puts "L'index avant condition: #{index}"
                unless index == 0
                    puts "Entrer dans la boucle à l'index: #{index}"
                    # The row return a hash, we save all Hash key in a new Array
                    cell = row.keys

                    # Insert the line in database,
                    #user = User.new
                    
                    credit = Credit.new 


                     # Begin insert a bank, before to insert bank we check if bank exist
                     if row[cell[0]].present?
                        current_credit = Credit.find_by(credit_id: row[cell[0]])
                        if current_credit.present?
                            current_credit = current_credit.credit_id + Time.now.min + Time.now.sec
                        else
                            current_credit = row[cell[0]]
                        end
                    end

                    # Begin insert a bank, before to insert bank we check if bank exist
                    if row[cell[3]].present?
                        current_customer = Customer.exists(row[cell[3]].downcase)
                        unless current_customer.present?
                            customer = Customer.new
                            customer.full_name = row[cell[3]].downcase if row[cell[3]].present?
                            customer.user_id = user.id
                            customer.save
                        end
                    end


                    # Begin insert a bank, before to insert bank we check if bank exist
                    if row[cell[4]].present?
                        current_bank = Bank.exists(row[cell[4]].downcase)
                        
                        # If bank exist.
                        unless  current_bank.present? 
                            bank = Bank.new
                            bank.name = row[cell[4]].downcase if row[cell[4]].present?
                            bank.commission_percentage = 0.0
                            bank.hypoplus_commission_percentage = 0.0
                            bank.company_remaining_commission_rate = 0.25
                            bank.user_id = user.id
                            bank.save

                        end
                    end

                    # Begin insert a user, before to insert user we check if user exist
                    if row[cell[6]].present?
                    current_contributor = User.is_contributor(row[cell[6]].downcase, 'Apporteur').present?

                        unless current_contributor.present?
                            if row[cell[6]].downcase != company
                                contributor = User.new
                                contributor.full_name = row[cell[6]].downcase if row[cell[6]].present?
                                contributor.email =  record_count.to_s + "a@exemple.com"
                                contributor.password = '12345678'
                                contributor.password_confirmation = '12345678'
                                #contributor.login = row[cell[6]].delete('').downcase
                                contributor.role = "Apporteur"
                                contributor.created_by = user.id
                                contributor.save

                                #Add conritbutor config.
                                commission_setting = CommissionSetting.new
                                commission_setting.commission_percentage = 0.3
                                commission_setting.user_id = contributor.id
                                commission_setting.save
                            end

                        end
                    end

                    if row[cell[7]].present?
                    
                        current_producer = User.is_producer(row[cell[7]].downcase, 'Producteur')
                        unless  current_producer.present?
                            if row[cell[7]].downcase != company
                                producer = User.new
                                producer.full_name = row[cell[7]].downcase if row[cell[7]].present?
                                producer.email = record_count.to_s + "p@exemple.com"
                                producer.password = '12345678'
                                producer.password_confirmation = '12345678'
                                #producer.login = row[cell[7]].delete(' ').downcase
                                producer.role = "Producteur"
                                producer.created_by = user.id
                                producer.save
                            end

                        end
                    end

                    if row[cell[8]].present?
                        
                        current_notary = Notary.is_notary(row[cell[8]].downcase).present?
                        unless  current_notary.present?
                            notary = Notary.new
                            notary.full_name = row[cell[8]].downcase if row[cell[8]].present?
                            notary.user_id = user.id
                            notary.save

                        end
                    end


                    credit.credit_id = current_credit
                    credit.production_date = row[cell[1]] if row[cell[1]].present?
                    credit.acte_date = row[cell[2]] if row[cell[2]].present?
                    credit.customer_name = row[cell[3]].downcase if row[cell[3]].present?
                    credit.bank_name = row[cell[4]].downcase if row[cell[4]].present?
                    credit.amount = row[cell[5]] if row[cell[5]].present?
                    credit.contributor_name = row[cell[6]].downcase if row[cell[6]].present?
                    credit.producer_name = row[cell[7]].downcase if row[cell[7]].present?
                    credit.notary_name = row[cell[8]].downcase if row[cell[8]].present?
                    credit.hypoplus = row[cell[9]] if row[cell[9]].present?
                    credit.user_id = user.id 
                    credit.save
                    # End saving
                    record_count += 1
                end
            end   
        

            log = Log.new
            log.file_name = file.original_filename
            log.no_record = record_count
            log.error = "Non"
            log.status = true
            log.user_id = user.id
            log.save
        end
        
        return true
    end

    #has_attached_file :file_name
    #validates_attachment :file_name, presence: true

end
