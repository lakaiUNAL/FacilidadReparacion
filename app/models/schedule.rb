class Schedule < ApplicationRecord
	belongs_to :service
	belongs_to :customer
	belongs_to :worker
	
end
