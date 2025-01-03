class InitSchema < ActiveRecord::Migration[7.0]
  def change

    create_table "users", charset: "utf8", force: :cascade do |t|
      t.string "name", null: false
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "archives", charset: "utf8", force: :cascade do |t|
      t.string "content"
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "row_order"
    end

    create_table "tasks", charset: "utf8", force: :cascade do |t|
      t.string "content"
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "row_order"
    end

  end
end
