class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build(comment_params)
        @comment.user = current_user  # Set the user as the current logged-in user
        @comment.commenter = current_user.username
        if @comment.save
          redirect_to article_path(@article), notice: "Comment was successfully created."
        else
          render :new
        end
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
      end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
        flash[:notice] = "Your comment was deleted."
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :status)
        end
end
