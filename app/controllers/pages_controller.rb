class PagesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all.order("created_at DESC")
    @cart = current_cart
    followingIds = current_user.following.map(&:id).reverse!
    @pagesFollow = Page.find(params = followingIds)
  end


  # GET /pages/1
  # GET /pages/1.json
  def show
    @user = current_user
    @cart = current_cart
    @page_products = @page.products
    @page_categories = @page.categories
    @page_posts = @page.posts.order("created_at DESC")
    @page = Page.find(params[:id])
  end

  # GET /pages/new
  def new
    @page = current_user.pages.build
  end

  # GET /pages/1/edit
  def edit
    unless session[:user_id] == @page.user.id
      flash[:notice] = "You don't have access to edit that page!"
      redirect_to pages_path(session[:user_id])
      return
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :description, :image, :genre, :opening_day, :closing_day, :opening_time, :closing_time, :page_notes)
    end
end
