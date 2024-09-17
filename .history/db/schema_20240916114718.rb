ActiveRecord::Schema[7.2].define(version: 2024_09_16_164217) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "body"
    t.text "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
