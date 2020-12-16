class Tag < ApplicationRecord
  has_many :company_tag_relations, dependent: :destroy
  has_many :comapanies, through: :company_tag_relations, dependent: :destroy
end
