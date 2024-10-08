class CommentsController < ApplicationController
    before_action :find_article
    before_action :require_same_user, only: [ :create, :destroy ]
    before_action :find_comment, only: [ :destroy ]

    def show
      @replies = @comment.replies
    end


    def new
        @comment = Comment.new
      end

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment posted"
            redirect_to @article
        else
            flash.now[:alert] = "Comment NOT posted"
            @article
        end
    end

    def destroy
      if @comment.user == current_user || current_user.admin?
        @comment.destroy
        flash[:notice] = "Comment was successfully deleted."
        redirect_to @article
      else
        flash.now[:alert] = "You are not authorized to delete this comment."
        @article
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
