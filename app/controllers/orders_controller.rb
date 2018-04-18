class OrdersController < ApplicationController
  before_action :authorize
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @cart = current_cart
    @user = current_user
    @orders = @user.orders.paginate(page: params[:page], per_page: 10).order("created_at DESC")
    @ordersAll = Order.all.order("created_at DESC")
    userProductIds = @user.products.map(&:id)
    @storeOwnerOrders = Order.joins(:line_items).where(line_items: {product_id: userProductIds}).distinct.paginate(page: params[:page], per_page: 10).order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = current_cart
    @user = current_user
    userProductIds = @user.products.map(&:id)
    @storeOwnerOrders = Order.joins(:line_items).where(line_items: {product_id: userProductIds}).distinct


    unless session[:user_id] == @order.user.id
      flash[:notice] = "You don't have access to that users orders!"
      redirect_to orders_path(session[:user_id])
      return
    end
  end

  # GET /orders/new
  def new
    @cart = current_cart
    @pages = Page.where(id: [$pageIds])
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end

    @stale_form_check_timestamp = Time.now.to_i

    @order = Order.new

    respond_to do |format|
      format.html
      format.json {render json: @order}
    end
  end

  # GET /orders/1/edit
  def edit
    @comments = Comment.all
    redirect_to 'show'
  end

  # POST /orders
  # POST /orders.json
  def create
    @pages = Page.where(id: [$pageIds])
    @cart = current_cart
    @order = current_user.orders.build(order_params)
    @order.add_line_items_from_cart(current_cart)
    @user = current_user

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_charge_path }
        format.json { render :show, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:pay_type, :user_id, :instructions, :access_options)
    end
end
