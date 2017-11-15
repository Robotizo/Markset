class Page < ApplicationRecord
	belongs_to :user
	has_many :products, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :categories, dependent: :destroy
	mount_uploader :image, ImageUploader

	DAYS_OF_WEEK = ["Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday", "Sunday"]
	validates :opening_day, presence: false
	validates :closing_day, presence: false
	validates :opening_time, presence: false
	validates :closing_time, presence: false
	validates :page_notes, presence: false

	validates :genre, presence: true
	validates :image, presence: true
	validates :title, presence: true, length: { 
  		maximum: 5,
  		tokenizer: lambda { |str| str.scan(/\w+/) },
  		too_long: "Limit your description to %{count} words"
	}
	validates :description, presence: true, length: { 
  		maximum: 50,
  		tokenizer: lambda { |str| str.scan(/\w+/) },
  		too_long: "Limit your description to %{count} words"
	}

	validates :title, uniqueness: true

	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower
end




