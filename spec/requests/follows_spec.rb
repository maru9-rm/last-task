require 'rails_helper'

RSpec.describe 'follows', type: :request do
  let!(:user) { create(:user) } 
  let!(:following) { create(:user) }

  describe 'POST /follows' do
    before do
      sign_in user
    end

    it 'フォローできている' do
      post account_follows_path({account_id: following})
      expect(response).to have_http_status(200)
      expect(Relationship.last.follower_id).to eq(user.id)
      expect(Relationship.last.following_id).to eq(following.id)
    end
  end

end