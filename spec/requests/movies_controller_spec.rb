require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  before(:all) do
    @category = Category.create!({ name: "romance", description: "a description for new category" })
  end

  before(:all) do
    @movie = Movie.create!({ name: "Test title", director: "Test", release_date: "01/20/2015", status: 1, category_id: @category.id })
  end
  let(:valid_params) {
    { name: "Test title", director: "Test", release_date: "01/20/2015", status: 1, category_id: @category.id }
  }

  describe "GET #index" do
    it "renders movie index" do
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
      patch :update, params: { id: @movie.id, movie: { name: "another movie name", director: "New Director" } }
      expect(response).to be_redirect
    end
  end

  describe "DELETE #destroy" do
    it "deletes the selected movie" do

      expect{ delete :destroy, params: { id: @movie.id } }.to change(Movie, :count).by(-1)
    end
  end

  describe "POST #toggle_available_status" do
    it "changes the movie status and redirects" do
      post :update, params: { id: @movie.id, movie: { status: 1, user: { name: "Someone", email: "someone@mail.com" } } }
      expect(response).to be_redirect
    end
  end
  
  describe "GET #search" do
    it "renders movie search" do
      result = Movie.where('LOWER(name) LIKE LOWER(?)', "%Test%")
      get :search, params: {}
      expect(result).to eq([@movie])
    end
  end
end