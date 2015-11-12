class JoinsController < ApplicationController



	def create
		user = User.find(params[:user_id])
		event = Event.find(params[:event_id])
		Join.create(user: user, event: event)
		redirect_to events_path
	end 

	def destroy
		join = Join.where(event_id: params[:id]).where(user_id: params[:user_id]).first
		puts join
		join.destroy
		redirect_to events_path
	end 

end
