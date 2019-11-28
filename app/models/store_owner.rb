class StoreOwner < ApplicationRecord
	belongs_to :user


	TERMS_AGREEMENT = ["Agree"]
	validates :store_owner_agreement, inclusion: TERMS_AGREEMENT, presence: true
end
