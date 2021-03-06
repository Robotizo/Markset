class StoreOwnersController < ApplicationController
  before_action :set_store_owner, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:index, :update, :edit]

  # GET /store_owners
  # GET /store_owners.json
  def index
    @store_owners = StoreOwner.all

  end

  # GET /store_owners/1
  # GET /store_owners/1.json
  def show
    @user = current_user
    @store_owner = StoreOwner.find(params[:id])
    @user_pages = @user.pages.order("created_at DESC")
    @user_categories = @user.categories.order("created_at DESC")
    @user_products = @user.products.order("created_at DESC")
    unless session[:user_id] == @store_owner.user.id
      flash[:notice] = "You don't have access to that."
      redirect_to store_path(session[:user_id])
      return
    end

  end

  # GET /store_owners/new
  def new
    @user = current_user
    @store_owner = @user.build_store_owner
  end

  # GET /store_owners/1/edit
  def edit
    unless session[:user_id] == @store_owner.user.id
      flash[:notice] = "You don't have access to that."
      redirect_to store_path(session[:user_id])
      return
    end
  end

  # POST /store_owners
  # POST /store_owners.json
  def create
    @user = current_user
    @store_owner = @user.create_store_owner(store_owner_params)

    respond_to do |format|
      if @store_owner.save
        format.html { redirect_to @store_owner, notice: 'Store owner was successfully created.' }
        format.json { render :show, status: :created, location: @store_owner }
      else
        format.html { render :new }
        format.json { render json: @store_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_owners/1
  # PATCH/PUT /store_owners/1.json
  def update
    respond_to do |format|
      if @store_owner.update(store_owner_params)
        format.html { redirect_to @store_owner, notice: 'Store owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_owner }
      else
        format.html { render :edit }
        format.json { render json: @store_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_owners/1
  # DELETE /store_owners/1.json
  def destroy
    @store_owner.destroy
    respond_to do |format|
      format.html { redirect_to store_owners_url, notice: 'Store owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def redirect_to_root
        redirect_to :back
      rescue ActionController::RedirectBackError
        redirect_to store_path
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_store_owner
      @store_owner = StoreOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_owner_params
      params.require(:store_owner).permit(:store_owner_agreement, :user_id)
    end
end
