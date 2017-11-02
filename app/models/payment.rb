class Payment < ApplicationRecord
    belongs_to :worker
	belongs_to :customer
end
