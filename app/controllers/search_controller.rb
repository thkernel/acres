class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  def index
  end
end
