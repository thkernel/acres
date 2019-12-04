require 'creek'
class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_excercise_year

  before_action :set_log, only: [:show, :edit, :update, :destroy]
  helper LogsHelper
  # Include personnal shared utils.
  include SharedUtils
  include SharedUtils::AppLogger
  
  layout "dashboard"


  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.where(excercise_year_id: current_excercise.id).order('created_at DESC')
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  def reset 
  end

  def reset_all 
    
    # Delete all bank.
    Bank.destroy_all

    producers = User.find_by_role("Producteur")
    producers.destroy_all
	
    contributors = User.find_by_role("Apporteur")
    contributors.destroy_all

    credits = Credit.where(excercise_year_id: current_excercise.id)
    credits.destroy_all

    commissions = Commission.where(excercise_year_id: current_excercise.id)
    
    commissions.destroy_all

    Customer.destroy_all

    Notary.destroy_all


    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Données supprimées avec succès!' }
      format.json { head :no_content }
      format.js
      end

    end

  # POST /logs
  # POST /logs.json
  def create
	  file = params[:log][:file_name]
	
    respond_to do |format|
      #if Log.import?(file, current_user)
      if import_processing?(file, current_user)
      
        # Now we are sure that the importation was succefull.
        #compute_commissions

        # Populate commissions.
        populate_commission
        #handle_commissions
        new_calculate_commissions

          format.html { redirect_to @log, notice: 'Log was successfully created.' }
          format.json { render :show, status: :created, location: @log }
          format.js
        else
          format.html { render :new }
          format.json { render json: @log.errors, status: :unprocessable_entity }
          format.js
        end
    end
    @logs = Log.where(excercise_year_id: current_excercise.id).order('created_at DESC')

  end

  
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:file_name, :no_record, :error, :status)
	end
	


	
	# Populate commission
	def populate_commission
		# Load the current admin user old comissions and we delete there after.
		#commission = current_user.commissions

    # Deleting the olds commissions before compute the news
    commissions = Commission.where(excercise_year_id: current_excercise.id)
		commissions.destroy_all #if commission.present?
		#Credit.destroy_all
		
    # Load all credits.

		#@credits = Credit.all
    #@credits = current_user.credits
    @credits = Credit.where(excercise_year_id: current_excercise.id)


		# Explore credits.
		@credits.each do |credit|
			# Instance of Commission.
			commission = Commission.new

			commission.credit_identifier = credit.identifier
			commission.production_date = credit.production_date
			commission.acte_date = credit.acte_date
			commission.customer_id = credit.customer_id if credit.customer_id
			commission.contributor_name = credit.contributor_name
			#commission.contributor_commission = credit.contributor_commission
			#comission.contributor_commission_percentage = contributor_commission_percentage
			commission.producer_name = credit.producer_name
			#commission.producer_commission = producer_commission
			#comission.producer_commission_percentage = producer_commission_percentage
			commission.bank_name = credit.bank_name
			#commission.bank_commission = bank_amount_commission
			#commission.bank_commission_percentage = bank_commission_percentage
			#commission.company_comission = company_commission_net
			commission.notary_name = credit.notary_name
      commission.amount_credit = credit.amount
      commission.excercise_year_id = current_excercise.id
			commission.user_id = current_user.id
			commission.save
		end

	end


  def import_processing?(file, user)
    # But before import in database, we delete all data in our model
    #Credit.delete_all#(user_id: user.id) #if Credit.find_by(user_id: user.id).present?
    credits = Credit.where(excercise_year_id: current_excercise.id)
    credits.destroy_all
   
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
                    current_credit = Credit.find_by(identifier: Extractor.extract_numeric(row[cell[0]]))
                   #current_credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  Extractor.extract_numeric(row[cell[0]]), current_excercise.id]).take
                   if current_credit.present?
                       if current_credit.hypoplus.present?
                           #next (old)
                           current_credit = current_credit.identifier + Time.now.min + Time.now.sec

                       else
                           current_credit = current_credit.identifier + Time.now.min + Time.now.sec
                       end
                   else
                       current_credit = Extractor.extract_numeric(row[cell[0]])
                  
                   end
               else
                   next
               end

               # Begin insert a bank, before to insert bank we check if bank exist
               if row[cell[3]].present?
                   current_customer = Customer.exists(row[cell[3]].downcase)
                   unless current_customer.present?
                       customer = Customer.new
                       customer.full_name = row[cell[3]].downcase if row[cell[3]].present?
                       #customer.excercise_year_id = current_excercise.id
                       customer.user_id = user.id
                       customer.save
                   end
               end


               # Begin insert a bank, before to insert bank we check if bank exist
               if row[cell[4]].present?
                   current_bank = Bank.exists(row[cell[4]].downcase).take
                   
                   # If bank not exist.
                   unless  current_bank.present? 
                       bank = Bank.new
                       bank.name = row[cell[4]].downcase if row[cell[4]].present?
                       #bank.commission_percentage = 0.0
                       #bank.hypoplus_commission_percentage = 0.0
                       #bank.company_remaining_commission_rate = 0.25
                       bank.excercise_year_id = current_excercise.id
                       bank.user_id = user.id
                       bank.save
                       current_bank = bank

                   end

                   #Add bank setting
                   unless have_bank_settings?(current_bank)
                    bank_setting = BankSetting.new
                    bank_setting.commission_percentage = 0.0
                    bank_setting.number_of_dates = 0
                    bank_setting.first_installment = 0.0
                    bank_setting.number_of_remaining_days = 0.0
                    bank_setting.hypoplus_commission_percentage = 0.0
                    bank_setting.company_remaining_commission_rate = 0.25
                    bank_setting.bank_id = current_bank.id
                    bank_setting.excercise_year_id = current_excercise.id
                    bank_setting.save
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
                           commission_setting.excercise_year_id = current_excercise.id
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
                       #notary.excercise_year_id = current_excercise.id
                       notary.user_id = user.id
                       notary.save

                   end
               end

               data_injection_logger.info("CREDIT ID: #{current_credit} SAVING...")
               #credit = Credit.new 
               credit.identifier = current_credit
               credit.production_date = row[cell[1]] if row[cell[1]].present?
               credit.acte_date = row[cell[2]] if row[cell[2]].present?
               credit.customer_name = row[cell[3]].downcase if row[cell[3]].present?
               credit.bank_name = row[cell[4]].downcase if row[cell[4]].present?
               credit.amount = row[cell[5]] if row[cell[5]].present?
               credit.contributor_name = row[cell[6]].downcase if row[cell[6]].present?
               credit.producer_name = row[cell[7]].downcase if row[cell[7]].present?
               credit.notary_name = row[cell[8]].downcase if row[cell[8]].present?
               credit.hypoplus = row[cell[9]] if row[cell[9]].present?
               credit.excercise_year_id = current_excercise.id
               credit.user_id = user.id 
               if credit.save
               
               data_injection_logger.info("CURRENT EXCERCISE: #{current_excercise.id}")
               data_injection_logger.info("CREDIT WAS SAVED...")
               else
                data_injection_logger.info("CREDIT WAS NOT SAVED...")
               end
               # End saving
               record_count += 1
           end
       end   
   

       log = Log.new
       log.file_name = file.original_filename
       log.no_record = record_count
       log.error = "Non"
       log.status = true
       log.excercise_year_id = current_excercise.id
       log.user_id = user.id
       log.save
       puts "SAVING SUCCESSFULL"
   end
   
   return true
end
	
end
