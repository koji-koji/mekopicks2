class Tag < ApplicationRecord
  has_many :users
  has_many :articles, through: :article_tags
end
