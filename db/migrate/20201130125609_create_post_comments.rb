class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :company_id
      t.string :nick_name
      t.integer :gender
      t.integer :employment_status

      t.timestamps
    end
  end
end
