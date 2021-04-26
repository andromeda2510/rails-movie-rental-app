module MoviesHelper
  def rent_movie (movie, user)
    user = User.new(user_params)
    return unless user.save

    movie.status = 1
    movie.user_id = user.id
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
