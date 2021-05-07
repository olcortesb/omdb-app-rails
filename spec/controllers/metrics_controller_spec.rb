require 'rails_helper'

RSpec.describe MetricsController, type: :controller do
  login_user

  before do
    @controller = MetricsController.new
  end

  describe 'GET #home' do
    it 'Return a success response' do
      get :home
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #home Assigns' do
    it 'Assigns to @latest value' do
      get :home
      expect(assigns[:latest]).to be_a(Movie)
    end

    it 'Assigns to @recent value' do
      get :home
      expect(assigns[:recent]).to be_a(Movie)
    end

    it 'Assigns to @rating value' do
      get :home
      expect(assigns[:rating]).to be_a(Movie)
    end

    it 'Assigns to @year_average value' do
      get :home
      expect(assigns[:year_average]).to be_a(Integer)
    end

    it 'Assigns to @runtime_max value' do
      get :home
      expect(assigns[:runtime_max]).to be_a(Movie)
    end

    it 'Assigns to @year_runtime value' do
      get :home
      expect(assigns[:year_runtime]).to be_a(Integer)
    end
  end

  describe 'GET #home' do
    it 'render the home metrics template' do
      get :home
      expect(response).to render_template :home
    end
  end
end
