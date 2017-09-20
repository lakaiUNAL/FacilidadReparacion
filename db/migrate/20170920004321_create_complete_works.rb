class CreateCompleteWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :complete_works do |t|
      # Complete work belongs to worker (association)
      t.belongs_to :worker, index: true
      t.text :calificacion
      t.text :comentario

      t.timestamps
    end
    
    # add foreing key worked
      add_foreign_key :complete_works , :workers
      
  end
end
