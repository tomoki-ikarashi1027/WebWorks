class Memo < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :title, presence: true
end
