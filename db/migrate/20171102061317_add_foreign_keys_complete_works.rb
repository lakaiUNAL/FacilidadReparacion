class AddForeignKeysCompleteWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :complete_works, :worker_id, :integer
    
    add_foreign_key :complete_works, :workers
    
    add_index :complete_works, :worker_id
  end
end
