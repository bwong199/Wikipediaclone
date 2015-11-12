class UsersController < ApplicationController
before_action :require_login, except: [:new, :create]
before_action :require_correct_user, only: [ :edit, :update, :destroy]
before_action :require_correct_user_delete, only: [:delete]

	def index

	end

	def new

	end 

	def create
		if User.create(user_params).valid? 
			User.create(user_params)
			last_user = User.last
			redirect_to user_path(last_user.id)
      	else
			flash[:error] =  "can't be blank. invalid" 
      		redirect_to new_user_path
		end 
    end


	def edit
		@user = User.find(params[:id])
	end 


	def show
		@user = User.find(params[:id])
		@userSecret = User.find(params[:id]).secrets.all
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
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
 	end


end
