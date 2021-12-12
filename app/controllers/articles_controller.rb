class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def index
        @articles = Article.all
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