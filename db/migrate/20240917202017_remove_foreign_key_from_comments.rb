class RemoveForeignKeyFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :comments, :articles
  end
end
