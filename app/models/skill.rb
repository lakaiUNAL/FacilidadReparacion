class Skill < ApplicationRecord
	belongs_to :worker
	belongs_to :service
	
	#validates :worker
	#validates :service
end
