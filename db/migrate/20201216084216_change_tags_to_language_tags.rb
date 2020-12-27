class ChangeTagsToLanguageTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :tags, :language_tags
  end
end
