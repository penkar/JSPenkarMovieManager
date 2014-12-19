class MoviesController < ApplicationController
	before_action :authenticate_user!, :except => [:public, :show]
	
	def index
		@id = current_user.id
		@movies = Movie.where(user_id:current_user.id).paginate(page: params[:page], per_page: 5)
	end

	def public
		if current_user
			@id = current_user.id
			@movies = Movie.order(:id).paginate(page: params[:page], per_page: 5)
		else 
			@id = 0
			@movies = Movie.order(:id).paginate(page: params[:page], per_page: 5)
		end
		render :index
	end

	def create
		@new_movie = User.find(current_user.id).movies.new
		@new_movie.title = params['movie']['title']
		@new_movie.format = params['movie']['format']
		@new_movie.length = params['movie']['length']
		@new_movie.release_year = params['movie']['release_year']
		@new_movie.rating = params['movie']['rating']
		if @new_movie.valid?
			@new_movie.save
			flash[:notice] = "Movie successfully created."
			redirect_to :action => "index"
		else
			flash[:error] = @new_movie.errors.messages
			render :new
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
		flash[:notice] = "Movie successfully updated."
		redirect_to :action => "index"
	end	

	def destroy
		Movie.find(params['id']).destroy
		flash[:notice] = "Movie successfully removed."		
		redirect_to :action => "index"
	end	
end
