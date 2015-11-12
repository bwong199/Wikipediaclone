class UsersController < ApplicationController

before_action :require_correct_user, only: [:show]
		def index

	end

	def new

	end 

	def create
		if User.create(user_params).valid? 
			User.create(user_params)
			last_user = User.last
			flash[:success] =  "User successfully created" 
			redirect_to sessions_path
      	else
			flash[:error] =  "Please fill in each field" 
      		redirect_to sessions_path
		end 
    end


	def edit
		@user = User.find(params[:id])
	end 


	def show
		@user = User.find(params[:id])
		@likes = User.find(params[:id]).likes
	
	end 

	def destroy
		@user = User.find(params[:user_id])
		@user.destroy
		session[:user_id] == nil
		redirect_to new_session_path
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		puts @user.errors.full_messages
		redirect_to user_path(params[:id])
	end 

	private 
  		def user_params
  		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
 	end
end
