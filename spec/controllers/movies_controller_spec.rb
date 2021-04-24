require 'rails_helper'

RSpec.describe 'Movies', type: :request do
    it 'assing all movies to @movies' do
        get root_path
        expect(response).to have_http_status(:found)
      end
  end