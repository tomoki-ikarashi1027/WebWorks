class ChangeCompanyTagRelationsToCompanyLanguagetagRelations < ActiveRecord::Migration[5.2]
  def change
    rename_table :company_tag_relations, :company_language_tag_relations
  end
end
