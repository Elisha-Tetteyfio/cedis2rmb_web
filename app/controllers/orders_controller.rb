class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[index update edit]

  # GET /orders or /orders.json
  def index
    @page = params[:page].to_i.positive? ? params[:page].to_i : 1
    @orders_status = params[:orders_status]
    @orders = Order.where(user: current_user).order(created_at: :desc).paginate(page: params[:page])

    # Filters
    @orders = Order.where(user: current_user, status: params[:orders_status]).paginate(page: params[:page]).order(created_at: :desc) if params[:orders_status].present?
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    order_params = session[:order_params]
    if order_params.present?
      @order = Order.new(order_params)
      @payer_account = @order.build_payer_account(order_params["payer_account_attributes"])
      @recipient_account = @order.build_recipient_account(order_params["recipient_account_attributes"])
    else
      @order = Order.new
      @payer_account = @order.build_payer_account
      @recipient_account = @order.build_recipient_account
    end

    @exchange_rate = ExchangeRate.current_rate.value
    @recipient_account_types = AccountType.rmb_accounts
    @payer_account_types = AccountType.cedi_accounts
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    session[:order_params] = order_params
    redirect_to summary_orders_path
  end

  # GET /orders/summary
  def summary
    order_params = session[:order_params]
    @recipient_account = RecipientAccount.new(order_params[:recipient_account_attributes])
    @payer_account = PayerAccount.new(order_params[:payer_account_attributes])
    @order = Order.new(order_params)
  end

  # POST /orders/confirm
  def confirm
    order_params = session[:order_params]
    @order = Order.new(order_params)
    @recipient_account = RecipientAccount.new(order_params["recipient_account_attributes"])
    @payer_account = PayerAccount.new(order_params["payer_account_attributes"])
    @order.rate = ExchangeRate.current_rate.value
    @order.status = "Pending"
    @order.recipient_account = @recipient_account
    @order.payer_account = @payer_account
    @order.user = current_user if current_user

    respond_to do |format|
      if @order.save
        session.delete(:order_params)
        format.html { redirect_to "/admin_account/#{@order.id}", notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
        :amount, :user_id, :rate, :status, :whatsapp_number,
        payer_account_attributes: [:account_number, :account_name, :account_type_id],
        recipient_account_attributes: [:account_number, :account_name, :account_type_id]
      )
    end
end
