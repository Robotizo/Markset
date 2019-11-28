class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.following.order('id ASC').reorder("created_at DESC")
    @cart = current_cart
    @pages= Page.all
    redirect_to store_path
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_comments = @post.comments.order("created_at DESC")
    @post = Post.find(params[:id])
    @post_attachments = @post.post_attachments.all
    @cart = current_cart
    @user = current_user
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    @post_attachment = @post.post_attachments.build
    @pages = Page.all
    @user = current_user
    $user_pages = @user.pages.order("created_at DESC")
  end

  # GET /posts/1/edit
  def edit
    @pages = Page.all
    @user = current_user
    @post = Post.find(params[:id])
    $user_pages = @user.pages.order("created_at DESC")
    unless session[:user_id] == @post.user.id
      flash[:notice] = "You don't have access to edit that post!"
      redirect_to store_path(session[:user_id])
      return
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @pages = Page.all
    @user = current_user

    respond_to do |format|
      if @post.save
        if params[:post_attachments].nil?
        else
           params[:post_attachments][:image].each do |img|
            @post_attachment = @post.post_attachments.create!(image: img, post_id: @post.id)
          end
        end
        format.html { redirect_to @post.page, notice: 'Post was successfully created.' }
      else
        1.times{ @post.post_attachments.build }
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      1.times{ @post.post_attachments.build }
      if @post.update(post_params)
         if params[:post_attachments].nil?
        else
           params[:post_attachments][:image].each do |img|
            @post_attachment = @post.post_attachments.create!(image: img, post_id: @post.id)
          end
        end
        format.html { redirect_to @post.page, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post.page, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content, :page_id, post_attachments_attributes: [:id, :post_id, :image])
    end
end
