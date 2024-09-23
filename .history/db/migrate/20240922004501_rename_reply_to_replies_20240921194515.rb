class RenameReplyToReplies < ActiveRecord::Migration[7.2]
  def change
    rename_table :reply, :replies
  end
end
