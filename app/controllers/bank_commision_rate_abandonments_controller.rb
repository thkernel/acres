class BankCommissionRateAbandonmentController < ApplicationController
    before_action :authenticate_user!
    before_action :current_excercise_year
    before_action :set_bank_commission_rate_abandonment, only: [:show, :edit, :update, :destroy]


    def index 
    end

    def show 
    end

    def edit 
    end

    def new 
        @bank_commission_rate_abandonment = BankCommissionRateAbandonment.new
    end

    def create 
    end 

    def delete 
    end 

    def destroy 
    end

    def update  
    end


    def set_bank_commission_rate_abandonment
        @bank_commission_rate_abandonment = BankCommissionRateAbandonment.find(params[:id])
    end

    def bank_commission_rate_abandonment_params 
        params.require(:bank_commission_rate_abandonment).permit(:bank_name, :credituid, :abandonment_rate)
    end

end