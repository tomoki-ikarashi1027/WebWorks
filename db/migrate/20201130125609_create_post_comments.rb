class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.integer :score
      t.integer :gender
      t.integer :employment_status

      t.timestamps
    end
  end
end
