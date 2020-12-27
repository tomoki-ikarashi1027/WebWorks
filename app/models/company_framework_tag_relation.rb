class CompanyFrameworkTagRelation < ApplicationRecord
  belongs_to :company
  belongs_to :framework_tag
end
