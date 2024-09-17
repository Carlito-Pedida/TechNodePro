class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:id])
        @comment = @article.comments.save(comment_params)
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end

end
