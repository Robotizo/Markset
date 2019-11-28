class RelationshipsController < ApplicationController
	before_action :authorize


	def create
		page = Page.find(params[:followed_id])
    current_user.follow(page)
    	respond_to do |format|
      		format.html { redirect_to page }
      		format.js
    	end
	end

	def destroy
		page = Relationship.find(params[:id]).followed
    current_user.unfollow(page)
    	respond_to do |format|
      		format.html { redirect_to page }
      		format.js
    	end
	end

end
