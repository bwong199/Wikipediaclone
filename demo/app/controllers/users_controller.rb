class UsersController < ApplicationController
  def index
    if errors?
      flash[:error] = "You have errors"
      redirect_to '/users/' #pathing will be explained later
    else
      flash[:success] = "You did it!"
      redirect_to '/users/'
    end
  end

  def main
    if signed_in?
      redirect_to "/users/show" #we can route with /controller/method, 
 #but note that this is considered a bad practice in Rails.
 #We will learn how to route in Rails in the 'routes' section
    else
      redirect_to new_users_path #this is the proper way to route in Rails
    end
  end
  def show
  end
  def new
  end

    def create
    #adds the value in params[:id] to the :id key in session
    session[:id] = params[:id] #we will talk about params in a bit
  end
  def log_out
    #sets the session[:id] to nil, overwriting the previous value
    session[:id] = nil
  end
end
