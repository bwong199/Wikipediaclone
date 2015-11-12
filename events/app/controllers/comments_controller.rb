class CommentsController < ApplicationController
	before_action :require_login, only: [:create]
	def create
		@event = Event.find(params[:event_id])
		@event.comments.create(comment_params)

		redirect_to "/events/#{@event.id}"
		flash[:success] =  "Comment created" 
    end

    private 
  	def comment_params
  		params.require(:comment).permit(:comment, :commentor)
 	end
end
