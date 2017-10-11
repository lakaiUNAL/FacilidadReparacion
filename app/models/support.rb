class Support < ApplicationRecord
    #add asocciation table
    belongs_to :worker
    
    has_attached_file :document
  	validates_attachment :document, content_type: {content_type: %w[application/pdf]}
  	validates :document, attachment_presence: true
end
