class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  def search
    @query = params[:query]
    @movies = Movie.where('LOWER(title) LIKE LOWER(?)', "%#{@query}%")
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :release_date, :status)
  end
end
