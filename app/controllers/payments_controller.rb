class PaymentsController < ApplicationController
    layout "dashboard"

    def index
        @banks = Bank.all
    end

    def credits
        @bank = Bank.find(params[:id])
        @commissions = Commission.where(bank_name: @bank.name.downcase)
        @total_commission_nette_company = @commissions.sum(:company_commission)
        @total_bank_commission = @commissions.sum(:bank_commission)

    end
end