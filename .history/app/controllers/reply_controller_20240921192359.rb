class ReplyController < ApplicationController
    before_action :find_comment
    before_action :require_same_user, only: [:create, :destroy]
    before_action :find_reply, only: [:destroy]
   
    def new
        @reply = Reply.new
      end

    def create
        @reply = Comment.find(params[:comment_id])
        @reply = @comment.replies.build(reply_params)
        @reply.user = current_user

        if @reply.save
            flash[:notice] = "Reply posted"
            redirect_to @article
        else
            flash.now[:alert] = "Reply unsuccessful"
            @article
        end
    end

    def destroy
      if @reply.user == current_user || current_user.admin?
        @reply.destroy
        redirect_to @article, notice: "reply was successfully deleted."
      else
        redirect_to @article, alert: "You are not authorized to perform this operation."
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
  