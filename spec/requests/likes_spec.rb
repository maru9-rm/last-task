require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:like) { create(:like, article: article, user: user ) }
  

  describe 'GET /likes' do
    before do
      sign_in user
    end

    it '200 Status' do
      get article_like_path(article_id: article.id)
      expect(response).to have_http_status(200)
    end
  end
end