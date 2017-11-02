class AddForeignKeysSupports < ActiveRecord::Migration[5.1]
  def change 
    
    add_column :supports, :worker_id, :integer
    
    
    add_foreign_key :supports, :workers
    
    
    
    add_index :supports, :worker_id
  end
end
