class Tag < ApplicationRecord
  has_many :users
  has_many :articles, throuth: :article_tags
end
