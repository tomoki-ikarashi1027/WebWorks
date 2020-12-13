class Company < ApplicationRecord
  belongs_to :prefecture
  attachment :image
  has_many :post_comments, dependent: :destroy

  with_options presence: true do
    validates :company_name
    validates :description
    validates :phone_number
  end

  def avg_score
    unless self.post_comments.empty?
      post_comments.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.post_comments.empty?
      post_comments.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

  # def review_score
  #   unless self.post_comments.empty?
  #     post_comments.(:score).round(1).to_f*100/5
  #   end
  # end

  def self.search(search)
    if search
    Company.where(['company_name LIKE ?', "%#{search}%" ])
    else
      # Company.all
    end
  end
end
