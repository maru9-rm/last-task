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

    regexp = Regexp.union(at_user_names_array)

    if @comment.content.match?(regexp)
      at_mentioned_user_name = @comment.content.scan(regexp)
      mentioned_user_name = at_mentioned_user_name.first.delete("@")
      mentioned_user = User.find_by(user_name: mentioned_user_name)
      MentionMailer.at_mark(mentioned_user,@comment.user).deliver_later
    end

    render json: @comment, include: { user: [ :profile] }
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id).merge(user_id: current_user.id)
  end

  def at_user_names_array
      user_names_array = User.pluck(:user_name)
      user_names_array.map { |t|
      "@" + t
    }
  end
  
end