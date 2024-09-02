class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @current_rate = ExchangeRate.current_rate.value
  end
end
