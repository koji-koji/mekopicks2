class Article < ApplicationRecord
  # mount_uploader :image, ImagesUploader
  has_many :users, through: :user_articles
  has_many :tags, through: :article_tags
  has_many :picks
  has_many :user_articles
end
