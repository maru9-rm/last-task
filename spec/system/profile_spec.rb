require 'rails_helper'


RSpec.describe 'Profile', type: :system do
    let!(:user){ create(:user, :with_profile) }

    context 'ログインしてる場合' do
        before do
            sign_in user
        end

        it '自分のプロフィールを確認できる' do
            visit profile_path
            expect(page).to have_css('.user-name', text: user.user_name)
        end
    end
end