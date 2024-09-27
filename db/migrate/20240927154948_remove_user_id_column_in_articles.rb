class RemoveUserIdColumnInArticles < ActiveRecord::Migration[7.2]
  def change
    remove_column :articles, :user_id, :integer
  end
end
