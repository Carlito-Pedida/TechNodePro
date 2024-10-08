<link rel="manifest" href="/views/pwa/manifest.json" />

background: linear-gradient(to right, #0767e6, #33aeff, #33aeff, #0767e6);

                <div class="mx-3 text-center">
                <%= form.text_area :body, class: "form-control shadow rounded", placeholder: "type your comment"  %>
                </div>

# Comment Controller

def create
@article = Article.find(params[:article_id])
@comment = @article.comments.create(comment_params)
flash[:notice] = "Your comment was posted."
redirect_to article_path(@article)
end

# Show Links

        <%= link_to "Back to articles list", articles_path %> ||
        <%= link_to "Edit Article", edit_article_path(@article) %> ||
        <%= link_to "Delete Article", articles_path(@article), data: {turbo_method: :delete, turbo_confirm: "Are you sure?"} %>

# Buttonless form function

    document.addEventListener('DOMContentLoaded', function() {

var inputField = document.getElementById('inputField');
var form = document.getElementById('inputForm');

inputField.addEventListener('keydown', function(event) {
if (event.key === "Enter") {
event.preventDefault(); // Prevent default form submission behavior
form.submit(); // Submit the form
}
});
});

# Session Navbar

<% if current_user.user_image.present? %>

<div class="picture_box mx-3">
<img src="<%= current_user.user_image%>">
</div>
<% else %>
<div class="avatar">
<h5><%= current_user.first_name[0].titlecase%><%= @article.user.last_name[0].titlecase%></h5>
</div>
<% end %>

# Back to articles link

    <li><%= link_to "Back to articles list", articles_path, class: "dropdown-item" %></li>

# comment controller

class CommentsController < ApplicationController
def create
@article = Article.find(params[:article_id])
@comment = @article.comments.create(comment_params)
flash[:notice] = "Your comment was posted."
redirect_to article_path(@article)
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
