class ProductCommentsController < ApplicationController
  before_action :set_product_comment, only: [:show, :edit, :update, :destroy]

  # GET /product_comments
  # GET /product_comments.json
  def index
    @product_comments = ProductComment.all
    redirect_to @product
  end

  # GET /product_comments/1
  # GET /product_comments/1.json
  def show
    @product = Product.find(params = @product_comment.product_id)
    @product_comment = ProductComment.new(product_id: params = @product_comment.product_id)
    @product_comments = @product.product_comments.order("created_at DESC")
    redirect_to @product
  end

  # GET /product_comments/new
  def new
    @product_comment = ProductComment.new(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
  end

  # GET /product_comments/1/edit
  def edit
    @product = Product.find(params = @product_comment.product_id)
  end

  # POST /product_comments
  # POST /product_comments.json
  def create
    @product_comment = current_user.product_comments.build(product_comment_params)
    @product = Product.find(params = @product_comment.product_id)
    @product_comments = @product.product_comments.order("created_at DESC")

    respond_to do |format|
      if @product_comment.save
        format.html { redirect_to @product, notice: 'Product comment was successfully created.' }
        format.json { render :show, status: :created, location: @product_comment }
      else
        format.html { render :new }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_comments/1
  # PATCH/PUT /product_comments/1.json
  def update
    @product = Product.find(params = @product_comment.product_id)
    respond_to do |format|
      if @product_comment.update(product_comment_params)
        format.html { redirect_to @product, notice: 'Product comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_comment }
      else
        format.html { render :edit }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_comments/1
  # DELETE /product_comments/1.json
  def destroy
    @product_comment.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_comment
      @product_comment = ProductComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_comment_params
      params.require(:product_comment).permit(:user_id, :product_id, :content)
    end
end
