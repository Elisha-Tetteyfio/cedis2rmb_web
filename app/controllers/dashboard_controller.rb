class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @current_rate = ExchangeRate.current_rate.value
    @admin_accounts = AdminAccount.all
  end
end
