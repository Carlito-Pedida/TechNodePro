class AddAdminToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :user, :admin, :boolean, default: false
  end
end
