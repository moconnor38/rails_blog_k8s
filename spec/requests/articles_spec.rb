require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    it 'returns http success' do
      get '/articles'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /articles' do
    it 'creates an article' do
      post '/articles', params: {
        'article': { 'title': 'A Test', 'body': 'A test message!' }
      }

      expect(Article.count).to eq(1)
    end
  end
end
