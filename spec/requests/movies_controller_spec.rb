require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  before(:all) do
    @category = Category.create!({ name: "romance", description: "a description for new category" })
  end

  let(:valid_params) {
    { name: "Test title", director: "Test", release_date: "01/20/2015", status: 1, category_id: @category.id }
  }

  describe "GET #index" do
    it "renders movie index" do
      movie = Movie.create! valid_params
      get :index, params: {}

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new movie" do
      # binding.pry
      expect{ post :create, params: { movie: valid_params } }.to change(Movie, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the selected movie and redirects" do
      movie = Movie.create! valid_params
      patch :update, params: { id: movie.id, movie: { name: "another movie name", director: "New Director" } }
      expect(response).to be_redirect
    end
  end
  
end
