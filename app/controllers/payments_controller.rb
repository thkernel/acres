class PaymentsController < ApplicationController
    layout "dashboard"

    def index
        @banks = Bank.all
    end

    def credits
        @bank = Bank.find(params[:id])
        @commissions = Commission.where(bank_name: @bank.name.downcase)
    end
end