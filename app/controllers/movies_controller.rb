class MoviesController < ApplicationController
	def index
		@movies = User.find(current_user.id).movies
	end

	before_action :authenticate_user!, :except => [:public]
	def create
		@new_movie = Movie.new
		@new_movie.title = params['movie']['title']
		@new_movie.format = params['movie']['format']
		@new_movie.length = params['movie']['length']
		@new_movie.release_year = params['movie']['release_year']
		@new_movie.rating = params['movie']['rating']
		@new_movie.user_id = params['user_id']['rating']
		@new_movie.save
 		redirect_to :action => "index"
	end

	def public
		@movies = Movie.all
		p @movies
	end

	def new
		@new_movie = Movie.new
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params['id'])
		@movie.title = params['movie']['title']
		@movie.format = params['movie']['format']
		@movie.length = params['movie']['length']
		@movie.release_year = params['movie']['release_year']
		@movie.rating = params['movie']['rating']
		@movie.save
 		redirect_to :action => "index"
	end	

	def destroy
		p params
		p 'hello'
		Movie.find(params['id']).destroy
		redirect_to :action => "index"
	end	
end
