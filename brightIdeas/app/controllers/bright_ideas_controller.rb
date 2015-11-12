class BrightIdeasController < ApplicationController
before_action :require_login, only: [:index, :create, :destroy]

	def index
		@user = User.find(session[:user_id])
		@posts = BrightIdea.all
		@likes = Like.all

	end 

	def show
		@bright_idea = BrightIdea.find(params[:id])
		@bright_idea_likes = BrightIdea.find(params[:id]).likes.all
		@likes = User.all.where(bright_ideas:params[:id])
	
		@posts = BrightIdea.all

	end 

	def create
		@user = User.find(params[:user_id])
		@user.bright_ideas.create(bright_idea_params)
		redirect_to bright_ideas_path
	
	end 

	def destroy
		@idea = BrightIdea.find(params[:id])
		@idea.destroy
		redirect_to bright_ideas_path

	end 

	private 
  	def bright_idea_params
  		params.require(:bright_idea).permit(:post, :idea_author)
 	end




end
