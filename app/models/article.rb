# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    validates :content, length: { maximum: 140 }

    has_many_attached :images
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
   
    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
