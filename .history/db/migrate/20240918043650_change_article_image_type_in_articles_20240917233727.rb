class ChangeArticleImageTypeInArticles < ActiveRecord::Migration[7.2]
  def change
    change_column :articles, :image_link, :text
  end
end
