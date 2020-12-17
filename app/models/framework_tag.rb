class FrameworkTag < ApplicationRecord
  has_many :company_framework_tag_relations, dependent: :destroy
  has_many :companies, through: :company_framework_tag_relations, dependent: :destroy

  validates :framework, presence: true
end
