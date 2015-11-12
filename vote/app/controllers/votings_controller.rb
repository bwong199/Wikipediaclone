class VotingsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index

	end 

	def create
		
		language = Language.where(language: params[:language])
		language.votings.create()
		redirect_to votings_path
	end 

end
