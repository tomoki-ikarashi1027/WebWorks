class RenameTagIdColumnToCompanyLanguageTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :company_language_tag_relations, :tag_id, :language_tag_id
  end
end
