class User < ActiveRecord::Base
	before_create { generate_token(:auth_token) }
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
	validates :username, format: { without: /\s/ }
	validates :email, presence: true, uniqueness: true
	has_secure_password
	after_destroy :ensure_an_admin_remains 
	has_many :pages, dependent: :destroy
	has_many :posts, dependent: :destroy

	has_many :products, dependent: :destroy
	has_many :categories, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :product_comments, dependent: :destroy
	has_many :charges, dependent: :destroy
	has_many :payments, dependent: :destroy
	mount_uploader :image, ImageUploader
	validate :freeze_username, on: :update
	PASSWORD_FORMAT = /\A
  		(?=.{8,})          # Must contain 8 or more characters
  		(?=.*\d)           # Must contain a digit
  		(?=.*[a-z])        # Must contain a lower case character
  		(?=.*[A-Z])        # Must contain an upper case character
  		(?=.*[[:^alnum:]]) # Must contain a symbol
	/x
	validates :password, presence: true, format: { with: PASSWORD_FORMAT }, on: :create
	validates :password, allow_nil: true, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :update


	has_many :store_owner, dependent: :destroy


	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed


	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
  		begin
    		self[column] = SecureRandom.urlsafe_base64
  		end while User.exists?(column => self[column])
	end


	def follow(page)
		following << page
	end

	def unfollow(page)
		following.delete(page)
	end

	def following?(page)
		following.include?(page)
	end

	class Error < StandardError
  	end

  	protected
	def freeze_username
    	errors.add(:username, "cannot be changed") if self.username_changed? 
  	end

	private
	def ensure_an_admin_remains
		if User.count.zero?
			raise Error.new "Can't delete last user"
		end
	end
end
