class CompanyLanguageTagRelation < ApplicationRecord
  belongs_to :company
  belongs_to :language_tag
end
