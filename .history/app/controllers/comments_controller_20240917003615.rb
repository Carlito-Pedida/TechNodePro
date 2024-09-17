class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])

        if @comment = @article.comments.create(comment_params)
        flash[:notice] = "Your comment was posted."
        redirect_to article_path(@article)
        else
        

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
            params.require(:comment).permit(:commenter, :body, :status)
        end
end
