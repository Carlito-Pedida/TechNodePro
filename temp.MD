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
