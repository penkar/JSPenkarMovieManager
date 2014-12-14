class MoviesController < ApplicationController
	before_action :authenticate_user!, :except => [:public, :show]
	
	def index
		@movies = User.find(current_user.id).movies
	end

	def create
		@user_new_movie = User.find(current_user.id).movies.new
		@user_new_movie.title = params['movie']['title']
		@user_new_movie.format = params['movie']['format']
		@user_new_movie.length = params['movie']['length']
		@user_new_movie.release_year = params['movie']['release_year']
		@user_new_movie.rating = params['movie']['rating']
		@user_new_movie.save
 		redirect_to :action => "index"
	end

	def public
		if current_user
			@movies = Movie.where(user_id:current_user.id)
			@movies2 = Movie.where.not(user_id:current_user.id)
		else 
			@movies2 = []
			@movies= Movie.all
		end
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
		Movie.find(params['id']).destroy
		redirect_to :action => "index"
	end	
end
