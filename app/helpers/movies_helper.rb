module MoviesHelper
  def rent_movie(movie)
    movie.status = 1
    movie.user_id
  end
end
