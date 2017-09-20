class Service < ApplicationRecord
	has_many :skills
	has_many :worker, through: :skill
end
