require 'rails_helper'

RSpec.describe 'Comment', type: :system do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:comments) { create_list(:comment, 3, user: user,article_id: article.id) }

  it 'コメント一覧が表示される' do
    visit '/users/sign_in'
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: 'password')
    click_on('Log in')
    visit article_comments_path(article_id: article)
    comments.each do |comment|
      expect(page).to have_content(comment.content)
    end
  end
end