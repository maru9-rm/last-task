class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def index
        recent_articles = Article.where(created_at: (1.days.ago)..(Time.now))
        featured_articles = recent_articles.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(5)

        user_ids = current_user.followings.pluck(:id)
        following_articles = Article.where(user_id: user_ids).order(id: "DESC").limit(10)

        unite_articles = featured_articles + following_articles
        @articles = unite_articles.uniq
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to articles_path, notice: '保存できたよ'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :content, images: [])
    end
    

end

