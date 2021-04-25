require 'rails_helper'

describe 'MoviesControllerWhitoutLogin' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end
  
  it 'fount indez' do
    @controller = MoviesController.new
    get :index
    expect(response).to have_http_status(:found)
  end
end