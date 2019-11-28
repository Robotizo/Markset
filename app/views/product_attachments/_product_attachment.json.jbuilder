json.extract! product_attachment, :id, :product_id, :image, :created_at, :updated_at
json.url product_attachment_url(product_attachment, format: :json)