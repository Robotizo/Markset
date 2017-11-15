class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @cart = current_cart
    @user = current_user
    redirect_to @user
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @cart = current_cart
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:notice] = "You don't have access to that user!"
      redirect_to users_path(session[:user_id])
      return
    end
    @user_pages = @user.pages.order("created_at DESC")
    @user_products = @user.products.order("created_at DESC")
    @user_categories = @user.categories.order("created_at DESC")
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:notice] = "You don't have access to that user!"
      redirect_to users_path(session[:user_id])
      return
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.signup_confirmation(@user).deliver
        format.html { redirect_to store, notice: "User #{@user.name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    current_password = params[:user].delete(:current_password)
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.authenticate(current_password) and @user.update(user_params)
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        @user.errors.add(:current_password, "or new password for #{@user.name} is incorrect") unless @user.authenticate(:current_password)
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :current_password, :password_confirmation, :image, :email, :username)
    end
end
