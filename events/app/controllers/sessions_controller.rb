class SessionsController < ApplicationController
	def index

	end 

	def new
	
	end 

	def log_out
		session[:user_id] = nil
		redirect_to '/sessions'
	end


	def log_in
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to events_path
    else
      flash[:errors] = 'Invalid Email and/or Password'
      redirect_to sessions_path
	end



end 
end
