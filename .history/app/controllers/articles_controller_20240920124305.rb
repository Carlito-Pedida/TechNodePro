class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
     @article = Article.new(article_contents)
     @article.user = User.find(5)
     if @article.save
      redirect_to @article
      flash[:notice] = "Article was created successfully."
     else
      render :new, status: :unprocessable_entity
     end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_contents)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article deleted."
    redirect_to articles_path, status: :see_other
  end

  private
  def article_contents
    params.require(:article).permit(:title, :description, :body, :reference, :image_link, :status)
  end
end
