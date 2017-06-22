class Tag < ApplicationRecord

  validates :name, uniqueness: true, presence: true
  has_many :users
  has_many :articles, through: :article_tags
  has_many :article_tags

end
