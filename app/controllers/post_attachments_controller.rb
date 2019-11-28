class PostAttachmentsController < ApplicationController
  before_action :authorize, except: [:show]
  before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]

  # GET /post_attachments
  # GET /post_attachments.json
  def index
    @post_attachments = PostAttachment.all
    @cart = current_cart
    redirect_to store_url, notice: 'Cannot access this page'
  end

  # GET /post_attachments/1
  # GET /post_attachments/1.json
  def show
    @cart = current_cart
    @post = Post.find(params = @post_attachment.post_id)
    @post_attachments = @post.post_attachments
  end

  # GET /post_attachments/new
  def new
    @post = Post.find(params[:post_id])
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1/edit
  def edit
    redirect_to store_path, notice: "Image Cannot be edited."
  end

  # POST /post_attachments
  # POST /post_attachments.json
  def create
    @post_attachment = @post.post_attachments.build(post_attachment_params)
    @post = Post.find(params[:post_id])

    respond_to do |format|
      if @post_attachment.save
        format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully created.' }
        format.json { render :show, status: :created, location: @post_attachment }
      else
        format.html { render :new }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_attachments/1
  # PATCH/PUT /post_attachments/1.json
  def update
    respond_to do |format|
      if @post_attachment.update(post_attachment_params)
        format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_attachment }
      else
        format.html { render :edit }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_attachments/1
  # DELETE /post_attachments/1.json
  def destroy
    @post_attachment.destroy
    respond_to do |format|
      format.html { redirect_to post_attachments_url, notice: 'Post attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attachment
      @post_attachment = PostAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_attachment_params
      params.require(:post_attachment).permit(:post_id, :image)
    end
end
