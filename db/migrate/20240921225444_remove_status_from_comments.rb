class RemoveStatusFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_column :comments, :status
    remove_column :articles, :status
  end
end
