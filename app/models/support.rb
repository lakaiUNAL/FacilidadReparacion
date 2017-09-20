class Support < ApplicationRecord
    #add asocciation table
    belongs_to :worker
    #validates foreing key
end
