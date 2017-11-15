class ProductAttachmentsController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :set_product_attachment, only: [:show, :edit, :update, :destroy]

  # GET /product_attachments
  # GET /product_attachments.json
  def index
    @product_attachments = ProductAttachment.all
    @cart = current_cart
    redirect_to store_url, notice: 'Cannot access this page'
  end

  # GET /product_attachments/1
  # GET /product_attachments/1.json
  def show
    @product = Product.find(params = @product_attachment.product_id)
    @cart = current_cart
    @product_attachments = @product.product_attachments.order("created_at DESC")
  end

  # GET /product_attachments/new
  def new
    @product_attachment = ProductAttachment.new
  end

  # GET /product_attachments/1/edit
  def edit
    redirect_to store_path, notice: "Image Cannot be edited."
  end

  # POST /product_attachments
  # POST /product_attachments.json
  def create
    @product_attachment = ProductAttachment.new(product_attachment_params)

    respond_to do |format|
      if @product_attachment.save
        format.html { redirect_to @product_attachment, notice: 'Product attachment was successfully created.' }
        format.json { render :show, status: :created, location: @product_attachment }
      else
        format.html { render :new }
        format.json { render json: @product_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_attachments/1
  # PATCH/PUT /product_attachments/1.json
  def update
    respond_to do |format|
      if @product_attachment.update(product_attachment_params)
        format.html { redirect_to @product_attachment, notice: 'Product attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_attachment }
      else
        format.html { render :edit }
        format.json { render json: @product_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_attachments/1
  # DELETE /product_attachments/1.json
  def destroy
    @product_attachment.destroy
    respond_to do |format|
      format.html { redirect_to product_attachments_url, notice: 'Product attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_attachment
      @product_attachment = ProductAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_attachment_params
      params.require(:product_attachment).permit(:product_id, :image)
    end
end
