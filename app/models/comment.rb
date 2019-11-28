class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates_presence_of :content, presence: true
end
