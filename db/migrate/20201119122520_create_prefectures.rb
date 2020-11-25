class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.integer :prefecture_name, null: false, default: 0

      t.timestamps
    end
  end
end
