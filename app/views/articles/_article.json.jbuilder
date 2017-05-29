json.extract! article, :id, :title, :image, :source, :created_at, :updated_at
json.url article_url(article, format: :json)
