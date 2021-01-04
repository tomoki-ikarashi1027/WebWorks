class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :body
      t.boolean :is_done, default: false, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
