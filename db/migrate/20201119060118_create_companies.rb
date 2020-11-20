class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :description
      t.integer :user_id
      t.integer :prefecture_id
      t.string :image_id
      t.text :comment

      t.timestamps
    end
  end
end
