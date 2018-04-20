class Product < ActiveRecord::Base
	has_many :line_items, dependent: :destroy 
	has_many :orders, through: :line_items, dependent: :destroy
	has_many :product_attachments, dependent: :destroy
	has_many :product_comments, dependent: :destroy
	accepts_nested_attributes_for :product_attachments, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}
	belongs_to :page
	belongs_to :category
	belongs_to :user
	before_destroy :ensure_not_referenced_by_any_line_item
	validates :title, :description, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true



	delegate :title, to: :order, prefix: true


	PRODUCT_AVAILABILITY = ["Available", "Not Available"]
	validates :status, inclusion: PRODUCT_AVAILABILITY


	def self.latest
		Product.order("created_at DESC")
	end

	def name_with_page
    	"#{title}, from #{page.title}"
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
