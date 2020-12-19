class Company < ApplicationRecord
  belongs_to :prefecture
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :company_language_tag_relations, dependent: :destroy
  has_many :company_framework_tag_relations, dependent: :destroy
  has_many :language_tags, through: :company_language_tag_relations, dependent: :destroy
  has_many :framework_tags, through: :company_framework_tag_relations, dependent: :destroy


  with_options presence: true do
    validates :company_name
    validates :description
    validates :phone_number
    validates :prefecture_id
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

  def self.search(search)
    if search
    Company.where(['company_name LIKE ?', "%#{search}%" ])
    else
      Company.all
    end
  end
end
