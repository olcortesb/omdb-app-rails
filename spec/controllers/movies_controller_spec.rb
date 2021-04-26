require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  login_user

  before do
    @controller = MoviesController.new
  end

  describe 'GET #index' do
    it 'Return a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #home Assigns' do
    it 'Assigns to @movies value' do
      get :index
      expect(assigns[:movies]).to be_a(ActiveRecord::Relation)
    end
  end

  describe 'GET #index' do
    it 'render the home index template' do
      get :index
      expect(response).to render_template :index
    end
  end
end
