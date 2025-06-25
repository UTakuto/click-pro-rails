class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end

    # ★ ユーザー×写真の組み合わせをユニークにする
    add_index :likes, [:user_id, :photo_id], unique: true
  end
end