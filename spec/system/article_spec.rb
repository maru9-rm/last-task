require 'rails_helper'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }


  it '記事一覧が表示される' do
    visit '/users/sign_in'
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: 'password')
    click_on('Log in')
    visit root_path
    articles.each do |article|
      expect(page).to have_content(article.content)
    end
  end
end