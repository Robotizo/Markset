class StoreController < ApplicationController
  skip_before_action :authorize

  def index
  	@products = Product.all.order("created_at DESC")
  	followingIds = current_user.following.map(&:id)
	@posts = Post.where(page_id: followingIds).order("created_at DESC")
  	@cart = current_cart
  	@pages = Page.all.order("created_at DESC")
  	@categories = Category.all.order("created_at DESC")
  end
end
