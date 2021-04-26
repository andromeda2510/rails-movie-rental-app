require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  before(:all) do
    @category = Category.create!({ name: "romance", description: "a description for new category" })
  end

  before(:all) do
    @movie = Movie.create!({ name: "Test title", director: "Test", release_date: "01/20/2015", status: 0, category_id: @category.id })
  end

  let(:valid_params) {
    { name: "Test title", director: "Test", release_date: "01/20/2015", category_id: @category.id }
  }

  describe "GET #index" do
    it "renders movie index" do
      get :index, params: {}

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "should be success" do
      expect(assigns(:movie)).to_not eq nil
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe "POST #create" do
    it "creates a new movie" do
      expect{ post :create, params: { movie: valid_params } }.to change(Movie, :count).by(1)
    end
    
    it "assigns a newly created movie as @movie" do
      post :create, params: { movie: valid_params }
      
      expect(assigns(:movie)).to be_a(Movie)
      expect(assigns(:movie)).to be_persisted
    end
  end

  describe "GET #edit" do
    it "should be success" do
      get :edit, params: { id: @movie.id }
      expect(assigns(:movie)).to eq(@movie)
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
    it "changes the movie status from rented to available" do
      post :toggle_available_status, params: { id: @movie.id, movie: { status: 1 }, user: { name: "Someone", email: "someone@mail.com" } }
      expect(response).to be_redirect
    end

   # it "changes the movie status from rented to available" do
      #post :toggle_available_status, params: { id: @movie.id, movie: { status: 0 } }
     # expect(response).to be_successful
    #end
  end
  
  describe "GET #search" do
    it "renders movie search" do
      result = Movie.where('LOWER(name) LIKE LOWER(?)', "%Test%")
      get :search, params: {}
      expect(result).to eq([@movie])
    end
  end

  describe "with invalid params" do

    # it "renders new template" do
    #   post :create, params: { movie: {name: 1, director: 2, release_date: "01/20/2015", status: 1, category_id: @category.id} }
    #   expect(response).to render_template('new')
    # end
    

    it "renders the 'edit' template" do
    patch :update, params: { id: @movie.id, movie: { status: 2, director: "New Director" } }
    expect(response).to render_template('edit')
    end
  end
end