class CreateFrameworkTags < ActiveRecord::Migration[5.2]
  def change
    create_table :framework_tags do |t|
      t.string :framework, null: false

      t.timestamps
    end
  end
end
