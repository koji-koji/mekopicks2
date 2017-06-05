class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :face, ImagesUploader
  has_many :articles, through: :user_articles
  has_many :picks
  has_many :user_articles
end
