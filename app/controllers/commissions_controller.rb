class CommissionsController < ApplicationController
    before_action :authenticate_user!
    layout "dashboard"

    def contributor
        @credits = Credit.all
    end

    def producer 
        @credits = Credit.all
    end

    def bank
        @credits = Credit.all
    end
end