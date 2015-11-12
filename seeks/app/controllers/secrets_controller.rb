class SecretsController < ApplicationController
before_action :require_login, only: [:index, :create, :destroy]
before_action :require_correct_user, only: [:show, :edit, :update]
before_action :require_correct_user_delete, only: [:delete]

  def index
    @secrets = Secret.all
    @likes = Like.all
    @user = current_user

  end

  def new

	end 


  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user_id == current_user.id
    redirect_to "/users/#{current_user.id}"
  end


	def create
		user = User.find(params[:user_id])
		user.secrets.create(content: params[:content])
		redirect_to "/users/#{user.id}"
	end


end
