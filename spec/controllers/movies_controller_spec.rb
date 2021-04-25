require 'rails_helper'

RSpec.describe 'MoviesController', type: :controller do
  login_user

  it 'assing all movies to @movies' do
    @controller = MoviesController.new
    get :index
    expect(response).to have_http_status(:ok)
  end

  # it "should have a current_user" do
  #   # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
  #   expect(subject.current_user).to_not eq(nil)
  # end
  #  login_user

=begin
  let(:valid_attributes) {
    { :title => "Test title!", :description => "This is a test description", :status => "draft" }
  }

  let(:valid_session) { {} }
=end

=begin
  describe "GET #index" do
    it "returns a success response" do
      Article.create! valid_attributes
      get :index, params: {}, session: valid_session

      # Make sure to swap this as well
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
      # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
    end
  end
=end
end
