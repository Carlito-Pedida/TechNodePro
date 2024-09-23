class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :show, :index ]
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
  
     @article = Article.new(article_contents)
      @article.user = current_user
      
     if @article.save
      redirect_to @article
      flash[:notice] = "Article was created successfully."
     else
      render :new, status: :unprocessable_entity
     end
  end



  def edit
  end

  def update
    if @article.update(article_contents)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article deleted."
    redirect_to articles_path
  end

  private
  def article_contents
    params.require(:article).permit(:title, :description, :body, :reference, :image_link)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You are not allowed to perform this operation"
      redirect_to @article
    end
  end
end
