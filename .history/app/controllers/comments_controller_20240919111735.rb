class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user = User.find(4).username  # Set the user as the current logged-in user
        @comment.commenter = @comment.user
        if @comment.save
             flash[:notice] = "Comment was successfully created."
          redirect_to article_path(@article), notice: 
        else
             flash[:notice] = "Your comment was not created"
            redirect_to article_path(@article)
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
