class Schedule < ApplicationRecord
	belongs_to :service
	belongs_to :customer
	belongs_to :worker
	#belongs_to :comentario
	#validates :service
	#validates :customer
	#validates :worker
end
