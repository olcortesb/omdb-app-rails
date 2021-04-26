require 'rails_helper'

RSpec.describe 'MoviesController', type: :controller do
  login_user

  before do
    @controller = MoviesController.new
  end

  it 'OK :index' do
    get :index
    expect(response).to have_http_status(:ok)
  end

end
