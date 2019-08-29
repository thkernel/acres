module GenerateBordereau 

    def generate_bordereau(credit_identifier, customer, installment_payment, current_excercise)
        
        export_directory(true)
       
        #credits = Credit.where(excercise_year_id: current_excercise)
        credit_details = CreditDetail.where(["credit_identifier = ? AND excercise_year_id = ?", credit_identifier, current_excercise])

        export_to_xls(credit_identifier, customer,  credit_details, installment_payment, current_excercise)
       

    end

    def export_to_xls(credit_identifier, customer, credit_details, installment_payment, current_excercise)


        if credit_details
            #credit_identifier = Credit.find_by(identifier: credit_details.first.credit_identifier).identifier

            #credit_identifier = Credit.find_by(identifier: credit_details.first.credit_identifier).identifier
            #customer = Credit.find_by(identifier: credit_details.first.credit_identifier).customer_name

            file_name = "bordereau_#{ Time.now.strftime("%Y%m%d%H%M%S")}"
            file_fullname = "public/exportations/bordereaux/#{file_name}.xlsx"
            
            File.open(file_fullname, 'w') do |file|
                file.write(ActionController::Base.new()
                .render_to_string(template: "credit_details/bordereau.xlsx.axlsx",
                layout: false, formats: [:axlsx], 
                locals: { 
                    credit_details: credit_details, 
                    credit_identifier: credit_identifier,
                    customer: customer 
                }
                ))
            end

            borderau = Borderau.new
            borderau.name = file_name
            #borderau.credit_identifier = credit_details.credit_identifier
            borderau.excercise_year_id = current_excercise
            borderau.file_name = file_fullname
            borderau.save
            
        end 
    end

    def export_directory(create=false)
        #backup_dir = "/home/#{ENV['USER']}/acres_backups"
        backup_dir = "#{Rails.root}/public/exportations/bordereaux"
        if create and not Dir.exists?(backup_dir)
          puts "Creating #{backup_dir} .."
          FileUtils.mkdir_p(backup_dir)
        end
        backup_dir
    end


end