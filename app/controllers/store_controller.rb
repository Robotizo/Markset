class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    @products = Product.all.order("created_at DESC")
    followingIds = current_user.following.map(&:id)
    @pagesFollowing = Page.find(params = followingIds).sort_by &:updated_at
    @pagesNotFollowing = Page.where.not(id: followingIds).order('updated_at DESC')
    @initialPosts = Post.all.order("created_at DESC")
    @cart = current_cart
    @pages = Page.all.order("created_at DESC")
    @categories = Category.all.order("created_at DESC")
    @notFollowingPages = Page.order("RANDOM()")
  end
end
