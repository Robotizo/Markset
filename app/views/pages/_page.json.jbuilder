json.extract! page, :id, :title, :description, :image_url, :genre, :created_at, :updated_at
json.url page_url(page, format: :json)