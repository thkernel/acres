class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"




  # GET /banks
  # GET /banks.json
  def index
   
      @banks = Bank.all
    
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create
    @banks = Bank.all
    @bank = current_user.banks.build(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
        format.json { render :show, status: :created, location: @bank }
        format.js
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    respond_to do |format|
	  if @bank.update(bank_params)
		bank_commission_edition = BankCommissionEdition.new
		bank_commission_edition.date_effet = params[:date_effet]
		bank_commission_edition.new_value = @bank.commission_percentage
		bank_commission_edition.bank_id = @bank.id
		bank_commission_edition.user_id = current_user.id
		bank_commission_edition.save

        @banks = Bank.all
        compute_commission(@bank.id)

        format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @bank = Bank.find(params[:bank_id])
  end
  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @banks = Bank.all
    @bank.destroy
    

    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'Bank was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:name, :description, :commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :number_of_remaining_days)
    end


    def compute_commissionsss(bank_name)
      bank = Bank.search(bank_name)

      puts "Bank name: " + bank.name

      # Get company infos required infos for the compute.
      if  current_company.present?
        company_name = current_company.name 
        company_commission_net = 0.0
        company_commission_percentage = 0.0

      end

      # Get contributor required infos for the compute.
      @bank_commissions = Commission.search_by_bank(bank_name)

      # Get bank infos required infos for the compute.
      
      if bank.present? && bank.commission_percentage.present?
        bank_commission_percentage = bank.commission_percentage 
        bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
        bank_amount_commission = 0.0
      end
      
      
      # Loop all commissions.
      @bank_commissions.each do |commission|
      
        if commission.amount_credit.present?
          credit_amount = commission.amount_credit 
        end

        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
        # Saving.
        commission.bank_commission = bank_amount_commission
        commission.bank_commission_percentage = bank_commission_percentage
        commission.user_id = current_user.id
        commission.save
      end
    end




    def compute_commission(bank_id)
      bank = Bank.find(bank_id)
      
  
      # Get company infos required infos for the compute.
      if  current_company.present?
        company_name = current_company.name 
        company_commission_net = 0.0
        company_commission_percentage = 0.0
  
      end
  
      # Get contributor required infos for the compute.
      @bank_commissions = Commission.search_by_bank(bank.name)

      # Get bank infos required infos for the compute.
      
      if bank.present? && bank.commission_percentage.present?
        bank_commission_percentage = bank.commission_percentage 
        bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
        bank_amount_commission = 0.0
      
      
        # Loop all commissions.
        @bank_commissions.each do |commission|
          contributor_name = commission.contributor_name 
          producer_name = commission.producer_name
  
          if contributor_name.present?

            contributor = User.find_user_by_name_and_role(contributor_name, 'Apporteur').first

            
              if contributor.present? && contributor.commission_setting.present?
                contributor_commission_percentage = contributor.commission_setting.commission_percentage 
                contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
                contributor_commission = 0.0
              end
          end
         
          if producer_name.present?
            producer = User.find_user_by_name_and_role(producer_name, 'Producteur').first

      
            if producer.present? && producer.commission_setting.present? 
              producer_commission_percentage = producer.commission_setting.commission_percentage 
              producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
              producer_commission = 0.0
            end
            
          end
        
  
        if commission.amount_credit.present?
          credit_amount = commission.amount_credit 
        end
  
        # Rule 1
        if contributor_name == company_name || producer_name == company_name || contributor_name.blank?
          contributor_commission_percentage = 0.0 
          producer_commission_percentage = 0.0
          
          contributor_commission = 0.0
          producer_commission = 0.0
          bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
          company_commission_net = bank_amount_commission
          company_commission_percentage = (company_commission_net / credit_amount) * 100
        end
  
        # Rule 2 
        if contributor_name ==  producer_name 
          if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
  
            contributor_commission = 0.0
            producer_commission = (credit_amount * producer_commission_percentage) / 100
            bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            company_commission_net = bank_amount_commission - producer_commission - contributor_commission
            company_commission_percentage = (company_commission_net / credit_amount) * 100
  
          end
          #else
          #if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
  
            #contributor_commission = (credit_amount * contributor_commission_percentage) / 100
            #producer_commission = (credit_amount * producer_commission_percentage) / 100
            #bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            #company_commission_net = bank_amount_commission - producer_commission - contributor_commission
          #end
        end
  
        # Rule 3 
        if contributor_name.present? && contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
          if contributor_name != producer_name  && contributor_name != company_name 
            
            producer_commission = (credit_amount * producer_commission_percentage) / 100
            bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            company_commission_net = bank_amount_commission - producer_commission 
            contributor_commission = (company_commission_net / 2 )+ (producer_commission / 2)
            company_commission_percentage = (company_commission_net / credit_amount) * 100
  
          end
  
          #elsif producer_name ==  company_name || producer_name.blank?
          #if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
            #contributor_commission = (credit_amount * contributor_commission_percentage) / 100
            #producer_commission = (credit_amount * producer_commission_percentage) / 100
            #bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            #company_commission_net = bank_amount_commission - producer_commission - contributor_commission
            #company_commission_net = company_commission_net - contributor_commission
          #end
        
        end
        # Rule 4
        #if producer_name.present? && contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
          #if producer_name == company_name || !producer_name.present?
  
            #contributor_commission = (credit_amount * contributor_commission_percentage) / 100
            #producer_commission = (credit_amount * producer_commission_percentage) / 100
            #bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            #company_commission_net = bank_amount_commission - producer_commission - contributor_commission
            #company_commission_percentage = (company_commission_net / credit_amount) * 100
  
          #end
        #end
  
        # Rule 5 (Hypoplus)
        #if hypoplus.present?
          #if producer_name != company_name || !producer_name.present?
            #contributor_commission = 0.0
            #bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            #producer_commission = (bank_amount_commission / 2) 
            #company_commission_net =  (bank_amount_commission / 2) 
          #else
  
            #contributor_commission = 0.0
            #bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
            #producer_commission = 0.0
            #company_commission_net =  bank_amount_commission 
          #end
        #end
  
        # Saving.
        commission.contributor_commission = contributor_commission
        commission.contributor_commission_percentage = contributor_commission_percentage
        commission.producer_commission = producer_commission
        commission.producer_commission_percentage = producer_commission_percentage
        commission.bank_commission = bank_amount_commission
        commission.bank_commission_percentage = bank_commission_percentage
        commission.company_commission = company_commission_net
        commission.company_commission_percentage = company_commission_percentage
        commission.user_id = current_user.id
        commission.save
      end
    end
      
      end
      
end
