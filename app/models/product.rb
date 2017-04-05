class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items
	belongs_to :page
	belongs_to :category

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format:{
		with: %r{\.(gif|jpg|png)\Z}i,
		message: "File must be a URL for a GIF, JPG or PNG image."
	}


 def self.latest
	Product.order("created_at DESC")
 end

 def self.search(search)
 	where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
 end

private
 def ensure_not_referenced_by_any_line_item
 	if line_items.empty?
 		return true
 	else
 		errors.add(:base, 'Line item present')
 		return false
 	end
 end



end
