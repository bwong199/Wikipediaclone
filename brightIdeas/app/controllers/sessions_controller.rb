class SessionsController < ApplicationController
	def new
	
	end 

	def log_out
		session[:user_id] = nil
		redirect_to sessions_path
	end


	def log_in
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to bright_ideas_path
    else
      flash[:errors] = 'Invalid'
      redirect_to sessions_path

	end

	

end 	
end
