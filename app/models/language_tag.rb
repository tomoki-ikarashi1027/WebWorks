class LanguageTag < ApplicationRecord
  has_many :company_language_tag_relations, dependent: :destroy
  has_many :companies, through: :company_language_tag_relations, dependent: :destroy

  validates :language, presence: true
end
