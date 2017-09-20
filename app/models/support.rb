class Support < ApplicationRecord
    #add asocciation table
    belongs_to :worker
    #validates foreing key
    validates :worker, :presence => true
end
