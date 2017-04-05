class Page < ApplicationRecord
	belongs_to :user
	has_many :products
	has_many :posts

	validates :title, :description, :image_url, :genre, presence: true
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format:{
		with: %r{\.(gif|jpg|png)\Z}i,
		message: "File must be a URL for a GIF, JPG or PNG image."
	}

	def self.search(search)
 		where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
 	end
end
