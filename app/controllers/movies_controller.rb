require 'salesforce'

class MoviesController < ApplicationController
  include MoviesHelper

  before_action :set_movie, only: %i[edit update destroy toggle_available_status]
  before_action :authenticate_user!, only: :toggle_available_status

  def index
    @movies = Movie.order(:name).page(params[:page])
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

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def toggle_available_status
    @movie.user = current_user
    if @movie.status == 1
      @movie.status = 0
    else
      rent_movie(@movie)
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

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
