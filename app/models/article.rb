class Article < ApplicationRecord
  has_many :users, through: :user_article
  has_many :picks
  has_many :user_article
end
