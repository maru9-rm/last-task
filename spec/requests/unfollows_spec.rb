require 'rails_helper'

RSpec.describe 'unfollows', type: :request do
  let!(:user) { create(:user) } 
  let!(:following) { create(:user) }

  describe 'POST /unfollows' do
    before do
      sign_in user
      user.follow!(following)
    end

    it 'フォローを外せる' do
      post account_follows_path({account_id: following})
      expect(response).to have_http_status(200)
    end
  end

end