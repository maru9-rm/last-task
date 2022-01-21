# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  context '内容が入力されている場合' do

    let!(:comment) { build(:comment, user: user, article: article) }

    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end

  context '内容が長すぎる' do
    let!(:comment) { build(:article, content: Faker::Lorem.characters(number: 300), user: user) }

    before do
      comment.save
    end

    it 'コメントを保存できない' do
      expect(comment.errors.messages[:content][0]).to eq('は140文字以内で入力してください')
    end

  end
end

