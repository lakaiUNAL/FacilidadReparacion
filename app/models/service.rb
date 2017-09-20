class Service < ApplicationRecord
	has_many :skills
	has_one :worker, through: :skill
end
