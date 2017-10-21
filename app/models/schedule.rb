class Schedule < ApplicationRecord
	belongs_to :request
	belongs_to :customer
	belongs_to :worker
	
end
