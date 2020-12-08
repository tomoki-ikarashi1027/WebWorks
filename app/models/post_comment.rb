class PostComment < ApplicationRecord
  belongs_to :company
  belongs_to :user

  enum gender: { 男性: 0, 女性: 1}
  enum employment_status: {正社員: 0, 契約社員: 1, アルバイト: 2}

  validates :score, presence: true
  validates :comment, presence: true,length: { minimum: 5 }

  def self_score_percentage
    score.round(1).to_f*100/5
  end
end
