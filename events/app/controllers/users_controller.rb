class UsersController < ApplicationController

	def new

	end 

	def edit
		@user = User.find(params[:id])
	end 

	def create
		if User.create(user_params).valid? 
			User.create(user_params)
			last_user = User.last
			flash[:success] =  "User successfully created" 
			redirect_to user_path(last_user.id)
      	else
			flash[:error] =  "Please fill in each field" 
      		redirect_to "/sessions"
		end 
    end

     def update
		@user = User.find(params[:id])
		@user.update(user_params)
		puts @user.errors.full_messages
		redirect_to events_path
	end 

    private 
  		def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :password_confirmation, :host)
 	end



end
