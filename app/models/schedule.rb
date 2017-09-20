class Schedule < ApplicationRecord
	belongs_to :service
	belongs_to :customer
	belongs_to :worker
	#belongs_to :comentario
	#validates :service, presence: true
	#validates :customer, presence: true
	#validates :worker, presence: true
end
