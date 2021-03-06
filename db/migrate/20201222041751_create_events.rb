class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
