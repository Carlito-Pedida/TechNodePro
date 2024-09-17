class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
     @article = Article.new(article_contents)

     if @article.save
      redirect_to @article
     else
      render :new, status: :unprocessable_entity
     end
  end

  private
  def article_contents
    params.require(:article).permit(:title, :description, :body, :reference)
  end

end
