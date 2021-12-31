require 'rails_helper'

RSpec.describe Article, type: :model do
  
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do

    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context '内容が入力されていない' do
    let!(:article) { build(:article, content: Faker::Lorem.characters(number: 300), user: user) }

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq('は140文字以内で入力してください')
    end

  end
end

