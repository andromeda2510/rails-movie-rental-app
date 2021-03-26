require 'salesforce'

class MoviesController < ApplicationController

  def index
    @movies = Movie.order(:name).all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def toggle_available_status
    @movie = Movie.find(params[:id])
    if @movie.status == 1
      @movie.status = 0
    else
      @user = User.new(user_params)
      if @user.save
        @movie.status = 1
        @movie.user_id = @user.id
      end
    end
    @movie.save
    # salesforce.update_status(@movie, @user)

    redirect_to movies_path
  end

  def search
    @query = params[:query]
    @movies = Movie.where('LOWER(name) LIKE LOWER(?)', "%#{@query}%")
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :release_date, :category_id, :status)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
