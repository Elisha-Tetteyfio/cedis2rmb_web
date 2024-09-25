class AdminAccountsController < ApplicationController
  before_action :set_order, only: %i[ index ]

  def index
    @admin_accounts = AdminAccount.all
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
