class Category < ApplicationRecord
	has_many :products
	belongs_to :user
	belongs_to :page
	validates_presence_of :name, precense: :true
	validates :name, presence: true, length: { 
  		maximum: 2,
  		tokenizer: lambda { |str| str.scan(/\w+/) },
  		too_long: "Limit your description to %{count} words"
	}
	mount_uploader :image, ImageUploader


	def name_with_page
    	"#{name}, from #{page.title}"
  	end
end
