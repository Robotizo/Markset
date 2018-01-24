class ProductsController < ApplicationController
  before_action :authorize, :except => [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :search]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @cart = current_cart

    if params[:search]
      @products = Product.search(params[:search]).order(:title)
    elsif params[:search] == nil
      @products = Product.all.order("created_at DESC")
    else
      @products = Product.all.order("created_at DESC")
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @cart = current_cart
    @product_attachments = @product.product_attachments.all
    @product = Product.find(params[:id])
    @product_comments = @product.product_comments.order("created_at DESC")
  end

  # GET /products/1
  # GET /products/1.json
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
    end
  end

  # GET /products/new
  def new
    @pages = Page.all
    @categories = Category.all
    @product = current_user.products.build
    @user = current_user
    $user_pages = @user.pages.order("created_at DESC")
    $user_categories = @user.categories.order("created_at DESC")
    @product_attachments = @product.product_attachments.build
  end

  # GET /products/1/edit
  def edit
    @pages = Page.all
    @categories = Category.all
    @user = current_user
    $user_pages = @user.pages.order("created_at DESC")
    $user_categories = @user.categories.order("created_at DESC")
    unless session[:user_id] == @product.user.id
      flash[:notice] = "You don't have access to edit that product!"
      redirect_to products_path(session[:user_id])
      return
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    @pages = Page.all
    @categories = Category.all
    @user = current_user

    respond_to do |format|
      if @product.save
        save_attachments if params[:product_attachments]
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        1.times{ @product.product_attachments.build }
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      1.times{ @product.product_attachments.build }
      update_attachments if params[:product_attachments]
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @product.page, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def save_attachments
      params[:product_attachments]['image'].each do |img|
        @product_attachment = @product.product_attachments.create!(image: img)
      end
    end

    def update_attachments
      @product.product_attachments.each(&:destroy) if @product.product_attachments.present?
        params[:product_attachments]['image'].each do |img|
          @product_attachment = @product.product_attachments.create!(image: img)
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :page_id, :category_id, :status, product_attachments_attributes: [:id, :product_id, :image])
    end
end
