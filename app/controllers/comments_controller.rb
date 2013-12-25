class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)   # instead of back to showing the single comment.
    # We might not have an @article object in this controller action, 
    # but we can find the Article associated with this Comment by calling @comment.article.
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
  
end
