class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
    @cart = current_cart
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
    @cart = current_cart
    @user = current_user
  end

  # GET /charges/new
  def new
    @cart = current_cart
    params[:order_id] = @order_id
    @charge = Charge.new(order_id: params[:order_id])
    lastOrder = Order.last.id
    @order = Order.find(params = lastOrder)
    @time_stamp = Time.now.to_i
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
    @user = current_user
    @charge = current_user.charges.build(charge_params)
    @cart = current_cart
    @charge.add_line_items_from_cart(current_cart)
    @order = current_user.orders.last 
    @pages = Page.where(id: [$pageIds]) 
    secondary_amount = @cart.total_price * 100
    overall_amount = secondary_amount.floor
    @charge.status = "complete"


    @amount = overall_amount

    @description = "#{current_user.name} Order ID: "

    if session[:last_created_at].to_i > params[:timestamp].to_i
        redirect_to @order, notice: 'Order has already been confirmed. You were not charged again.' 
    else
    respond_to do |format|
      @time_stamp = Time.now.to_i
      session[:last_created_at] = @time_stamp
      if @charge.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifierMailer.confirmed(@order, @user).deliver
        @pages.each do |page|
          OrderNotifierMailer.producerConfirmed(@order, page, @user).deliver
        end
        if @order.pay_type == "Card"
          begin
            customer = Stripe::Customer.create(
              email: params[:stripeEmail],
              source: params[:stripeToken]
            )
            charge = Stripe::Charge.create(
              customer: customer.id,
              amount: @amount,
              description: @description + @order.id.to_s,
              currency: 'cad'
            )
            rescue Stripe::CardError => e
              flash[:error] = e.message
              redirect_to new_charge_path
          end
          format.html { redirect_to @order, notice: 'Thank you for buying from Markset, here is your purchased list.' }
          format.json { render :show, status: :created, location: @order }
        elsif @order.pay_type == "Cash"
          format.html { redirect_to @order, notice: 'Thank you for buying from Markset, here is your purchased list.' }
          format.json { render :show, status: :created, location: @order }
        end
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:order_id, :status)
    end
end
