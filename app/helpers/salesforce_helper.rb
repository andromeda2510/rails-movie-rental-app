require "httparty"

class SalesforceHelper
  include HTTParty
  def update_status(movie, user)
    @result = HTTParty.post(@urlstring_to_post.to_str,
      body = { movie: {  name: movie.name,
                          director: movie.director,
                          category: movie.category.name,
                          release_date: movie.release_date,
                          status: movie.status },
               user: { name: user.name, email: user.email }
              }.to_json,
      headers = { 'Content-Type' => 'application/json' })
  end

end