class PostComment < ApplicationRecord
  belongs_to :company

  enum gender: { 男性: 0, 女性: 1}
  enum employment_status: {正社員: 0, 契約社員: 1, アルバイト: 2}
end
