class LikesController < ApplicationController
before_action :require_login, only: [:create, :destroy]
before_action :require_correct_user, only: [:show, :edit, :update]
before_action :require_correct_user_delete, only: [:delete]

def index
	
	@likes = Secret.likes.all
end 

def create
	user = User.find(params[:user_id])
	secret = Secret.find(params[:secret_id])
	Like.create(user: user, secret: secret)
	redirect_to secrets_path
end 

def destroy
	like = Like.where(user_id: params[:user_id]).first
	current_user = User.find(params[:user_id])
	puts current_user
	like.destroy
	redirect_to secrets_path
end 




end
