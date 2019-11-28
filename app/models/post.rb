class Post < ApplicationRecord
	belongs_to :user
	belongs_to :page, touch: true
	has_many :comments, dependent: :destroy
	validates_presence_of :content, presence: true
	has_many :post_attachments, dependent: :destroy
	accepts_nested_attributes_for :post_attachments, allow_destroy: true
end
