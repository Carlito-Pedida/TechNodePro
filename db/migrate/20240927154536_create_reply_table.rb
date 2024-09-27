class CreateReplyTable < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.text :reply_body
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
