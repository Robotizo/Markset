class CategoriesController < ApplicationController
  before_action :authorize, :except => [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order("created_at DESC")
    @cart = current_cart
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @user = current_user
    @category = Category.find(params[:id])
    @category_products = @category.products
    @cart = current_cart
  end

  # GET /categories/new
  def new
    @user = current_user
    @pages = Page.all
    @category = current_user.categories.build
    @category_products = @category.products
    $user_pages = @user.pages.order("created_at DESC")
  end

  # GET /categories/1/edit
  def edit
    @user = current_user
    @pages = Page.all
    $user_pages = @user.pages.order("created_at DESC")
    unless session[:user_id] == @category.user.id
      flash[:notice] = "You don't have access to edit that category!"
      redirect_to products_path(session[:user_id])
      return
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @user = current_user
    @pages = Page.all
    @category = current_user.categories.build(category_params)
    @category_products = @category.products 

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :image, :page_id)
    end
end
