class CreateCompanyTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :company_tag_relations do |t|
      t.references :company, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
