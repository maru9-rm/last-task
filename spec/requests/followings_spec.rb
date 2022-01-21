require 'rails_helper'

RSpec.describe 'followings', type: :request do
  let!(:user) { create(:user) } 

  describe 'GET /followings' do
    before do
      sign_in user
    end

    it '200 Status' do
      get account_following_path(account_id: user.id)
      expect(response).to have_http_status(200)
      
    end
  end
end