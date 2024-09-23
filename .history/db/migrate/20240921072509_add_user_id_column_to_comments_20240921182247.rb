class AddUserIdColumnToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :username, null: false, foreign_key: true
  end
end
