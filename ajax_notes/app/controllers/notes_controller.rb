class NotesController < ApplicationController
	skip_before_filter :verify_authenticity_token  # skip verifying the authenticity token
	def index
		@notes = Note.all

	end 

	def ajax
		@notes = Note.all
		@notes.to_json


		render json:@notes
	end

	def partial

		@notes = Note.all
	end 

	def create
		json_message = Note.create(title: params[:title])
		render json:json_message
	end 

	 def update
		@note = Note.find(params[:id])
		@note.update(description: params[:description])
		redirect_to notes_path
	end 

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to notes_path
	end 

	private 
  	def note_params
  		params.require(:note).permit(:description, :title)
 	end




end
