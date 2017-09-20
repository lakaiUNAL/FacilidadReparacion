class Request < ApplicationRecord
	belongs_to :customer
	belongs_to :service
	#validates :service_id, presence: true
	#validates :article, presence: true
	#validates :description, presence: true	
end
