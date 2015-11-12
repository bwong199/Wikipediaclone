class LikesController < ApplicationController
	def create
	user = User.find(params[:user_id])
	bright_idea = BrightIdea.find(params[:post_id])
	Like.create(user: user, bright_idea: bright_idea)
	redirect_to bright_ideas_path
	end
end
