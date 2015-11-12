class EventsController < ApplicationController
	def index
		@location = User.find(session[:user_id]).location
		@events = Event.where(location: @location)
		@joins = Join.all 

		@otherEvents = Event.where.not(location: @location)

		join = Join.where(event_id: 5).where(user_id: 2)
		puts join

	end


	def edit
		@event = Event.find(params[:id])
	end 

	def show
		@event = Event.find(params[:id])
		@comments = Event.find(params[:id]).comments.all
		@joins = Join.where(event_id: params[:id]).all
	end 

	def create
		@user = User.find(params[:user_id])
    	@user.events.create(event_params)
		redirect_to events_path
		flash[:success] =  "Event created" 
    end

    def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

	def update

		@event = Event.find(params[:event_id])
		
		@event.update(event_params)
		redirect_to events_path
	end 


    private 
  		def event_params
  		params.require(:event).permit(:name, :date, :location, :description, :host)
 	end

end
