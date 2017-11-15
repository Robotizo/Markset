class ProductComment < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates_presence_of :content, presence: true
end
