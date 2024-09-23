class CommentsController < ApplicationController
    before_action :find_article
    before_action :require_same_user, only: [:create, :destroy]
    before_action :find_comment, only: [:destroy]
   
  
    def create
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      @comment.commenter = current_user.username
  
      if @comment.save
        redirect_to @article, notice: "Comment was successfully created."
      else
        redirect_to @article, alert: "Comment could not be saved. Please check the errors."
      end
    end
  
    def destroy
      if @comment.user == current_user || current_user.admin?
        @comment.destroy
        redirect_to @article, notice: "Comment was successfully deleted."
      else
        redirect_to @article, alert: "You are not authorized to delete this comment."
      end
    end
  
    private
  
    def find_article
      @article = Article.find(params[:article_id])
    end
  
    def find_comment
      @comment = @article.comments.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end

    def require_same_user
        unless logged_in?
          flash[:alert] = "You are not allowed to perform this operation"
          redirect_to @article
        end
      end

  end
  