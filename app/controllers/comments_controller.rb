class CommentsController < ApplicationController
    def new
      @article = Article.find(params[:article_id])
      @comment = @article.comments.build
    end

    def index
      article = Article.find(params[:article_id])
      comments = article.comments
      render json: comments, each_serializer: CommentSerializer, include: { user: [ :profile] }
    end
    
  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.save!

    render json: @comment, include: { user: [ :profile] }
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id).merge(user_id: current_user.id)
  end

end