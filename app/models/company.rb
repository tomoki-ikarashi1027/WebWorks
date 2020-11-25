class Company < ApplicationRecord
  belongs_to :prefecture
  attachment :image
end
