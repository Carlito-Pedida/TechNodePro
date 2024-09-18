class AddArticleImageColumn < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :image_link, :string
  end
end
