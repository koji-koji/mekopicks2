class Article < ApplicationRecord
  has_many :users, through: :user_articles
  has_many :picks
  has_many :user_articles
end
