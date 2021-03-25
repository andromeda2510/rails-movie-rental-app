class MoviesController < ApplicationController
  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :release_date, :status)
  end
end
