class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def create
	end

	def new
	end

	def show
	end

	def update
	end

	def update
	end	

	def destroy
		Movie.find(params['id']).destroy
	end	
end