class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def create
		@new_movie = Movie.new
		@new_movie.title = params['movie']['title']
		@new_movie.format = params['movie']['format']
		@new_movie.length = params['movie']['length']
		@new_movie.release_year = params['movie']['release_year']
		@new_movie.rating = params['movie']['rating']
		@new_movie.save
 		redirect_to :action => "index"
	end

	def new
		@new_movie = Movie.new
	end

	def show
	end

	def update
	end

	def update
	end	

	def destroy
		p params
		p 'hello'
		Movie.find(params['id']).destroy
		redirect_to :action => "index"
	end	
end
