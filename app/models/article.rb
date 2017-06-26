class Article < ApplicationRecord
  # mount_uploader :image, ImagesUploader
  validates :url, presence: true
  has_many :users, through: :user_articles
  has_many :tags, through: :article_tags
  has_many :picks
  has_many :user_articles
  has_many :article_tags

end
