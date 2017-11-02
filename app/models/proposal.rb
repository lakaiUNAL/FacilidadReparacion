class Proposal < ApplicationRecord
    belongs_to :worker
    belongs_to :request
    has_one :customer, through: :request
    has_one :service, through: :request

end
