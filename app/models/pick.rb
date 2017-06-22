class Pick < ApplicationRecord
  validates :url, presence: true
  belongs_to :article
  belongs_to :user
end
