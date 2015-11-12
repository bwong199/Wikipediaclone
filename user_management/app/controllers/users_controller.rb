class UsersController < ApplicationController
	def index
  	@users = User.all
	end

	def new

	end 

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to '/users/'
	end

	def show
		@user = User.find(params[:id])

	end


	def create

	if params[:first_name].blank? || params[:last_name].blank?
		flash[:notice] =  "First name can\'t be blank. Last name can\'t be blank"
      redirect_to '/users/new'
      
      else
      User.create( first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
	redirect_to '/users'
    end

	end



	def edit
		@user = User.find(params[:id])
		render 'edit'
	end 

	def update
	  @user = User.find(params[:id])
	  @user.update(user_params)
	  redirect_to '/users'
	end

	private 
  		def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
 	end
	




	





end
