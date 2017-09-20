class CreateSupports < ActiveRecord::Migration[5.1]
  def change
    
    create_table :supports do |t|
      
      # supports belongs to worker (association)
      t.belongs_to :worker, index: true
      t.text :documento_pdf

      t.timestamps
    end
    
    #add foreing key worked
      add_foreign_key :supports, :workers
  end
end
