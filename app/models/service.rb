class Service < ApplicationRecord
    has_many :skills
	has_many :worker, through: :skill
	has_many :request
end
