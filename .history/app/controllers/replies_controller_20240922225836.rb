class RepliesController < ApplicationController
    before_action :find_comment
    before_action :require_same_user, only: [:create, :destroy]
    before_action :find_reply, only: [:destroy]
   
    def new
        @reply = Reply.new
      end

    def create
        @comment = Comment.find(params[:comment_id])
        @article= @comment.article
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
  
    def find_comment
      @comment = Comment.find(params[:comment_id])
    end
  
    def find_reply
        @reply = @comment.reply.find(params[:id])
    end
  
    def reply_params
        params.require(:reply).permit(:reply_body)
      end

    def require_same_user
        unless logged_in?
          flash[:alert] = "You are not allowed to perform this operation"
          redirect_to @article
        end
    end
   

  end
  