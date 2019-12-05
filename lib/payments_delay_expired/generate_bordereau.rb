module GenerateBordereau 

    def generate_bordereau?(credit, payment_timetable, current_payment_timetable_detail, current_excercise)
        
        export_directory(true)
       
       
        payment_timetable_details = PaymentTimetableDetail.where(payment_timetable_id: payment_timetable.id).reorder('id ASC')

        export_to_xls(credit, payment_timetable,  current_payment_timetable_detail, payment_timetable_details, current_excercise)
       puts "FIN FENERATION BORDEREAU"

    end

    def export_to_xls(credit, payment_timetable,  current_payment_timetable_detail,  payment_timetable_details, current_excercise)


        if payment_timetable_details

           if payment_timetable.target == "contributor"
            target_name = credit.contributor_name
            puts "TARGET NAME #{payment_timetable.target}: #{target_name}"
           elsif payment_timetable.target == "producer"
            target_name = credit.producer_name
            puts "TARGET NAME #{payment_timetable.target}: #{target_name}"

           end

            puts "DEBUT EXPORT TO XLS"
            file_name = "bordereau_#{payment_timetable.target}_#{current_payment_timetable_detail.id}_#{ Time.now.strftime("%Y%m%d%H%M%S")}"
            file_fullname = "public/exportations/bordereaux/#{file_name}.xlsx"
            
            File.open(file_fullname, 'w') do |file|
                file.write(ActionController::Base.new()
                .render_to_string(template: "payment_timetable_details/bordereau.xlsx.axlsx",
                layout: false, formats: [:axlsx], 
                locals: { 
                    payment_timetable_details: payment_timetable_details, 
                    credit_identifier: credit.identifier,
                    customer: credit.customer_name,
                    target_name: target_name,
                    installment: current_payment_timetable_detail.installment_payment,
                    amount: payment_timetable_details.sum(:commission)
                }
                ))
            end

            borderau = Borderau.new
            borderau.name = file_name
            borderau.credit_identifier = credit.identifier
            borderau.excercise_year_id = current_excercise
            borderau.file_name = file_fullname
            if borderau.save
                puts "FIN EXPORT TO XLS"
            end
            
        end 
    end

    def export_directory(create=false)
        #backup_dir = "/home/#{ENV['USER']}/acres_backups"
        backup_dir = "#{Rails.root}/public/exportations/bordereaux"
        if create and not Dir.exists?(backup_dir)
          #puts "Creating #{backup_dir} .."
          FileUtils.mkdir_p(backup_dir)
        end
        backup_dir
    end


end