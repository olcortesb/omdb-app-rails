require 'rails_helper'

describe 'MetricsController' do
  before do
    @controller = MetricsController.new
  end

  it 'OK :home' do
    get :home
    expect(response).to have_http_status(:found)
  end
end