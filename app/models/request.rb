class Request < ApplicationRecord
	belongs_to :customer
	belongs_to :service
	#validates :service_id, presence: true
	#validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	#validates :description, presence: true	
end
