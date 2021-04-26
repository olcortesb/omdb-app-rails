require 'rails_helper'

describe 'MoviesControllerWhitoutLogin' do
  before do
    @controller = MoviesController.new
  end

  it 'fount indez' do
    get :index
    expect(response).to have_http_status(:found)
  end
end