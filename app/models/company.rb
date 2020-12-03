class Company < ApplicationRecord
  belongs_to :prefecture
  attachment :image
  has_many :post_comments, dependent: :destroy

end
