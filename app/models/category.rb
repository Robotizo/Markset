class Category < ApplicationRecord
	has_many :products
	validates :image_url, allow_blank: true, format:{
		with: %r{\.(gif|jpg|png)\Z}i,
		message: "File must be a URL for a GIF, JPG or PNG image."
	}
end
