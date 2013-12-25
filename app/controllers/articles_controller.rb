class ArticlesController < ApplicationController
  include ArticlesHelper
  
  def index
    @articles = Article.all
  end
  
  
  def show
    @article = Article.find(params[:id])
    
    @comment = Comment.new
    @comment.article_id = @article.id  # Due to the Rails’ mass-assignment protection, the article_id attribute of the new Comment object needs to be manually assigned with the id of the Article. Why do you think we use Comment.new instead of @article.comments.new?
  end
  
  
  def new    # display the form, send its form data to create action
    @article = Article.new  # create a blank Article object so Rails could figure out which fields an article has
  end
  
  
  def create   # process the form data
    @article = Article.new(article_params)    # article_params is in the helper
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"    
    redirect_to article_path(@article)
  end
  
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"    
    redirect_to action: 'index'
  end
  
  
  def edit        # send its from data to update action
    @article = Article.find(params[:id])
  end
  
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash.notice = "Article '#{@article.title}' Updated!"
    
    redirect_to article_path(@article)
  end
end
