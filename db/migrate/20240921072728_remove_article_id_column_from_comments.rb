class RemoveArticleIdColumnFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_column :comments, :article_id, :integer
  end
end
