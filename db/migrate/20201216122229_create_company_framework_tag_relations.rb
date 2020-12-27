class CreateCompanyFrameworkTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :company_framework_tag_relations do |t|
      t.references :company, foreign_key: true
      t.references :framework_tag, foreign_key: true

      t.timestamps
    end
  end
end
