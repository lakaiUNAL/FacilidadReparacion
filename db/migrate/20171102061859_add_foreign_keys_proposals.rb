class AddForeignKeysProposals < ActiveRecord::Migration[5.1]
  def change
    
    add_column :proposals, :request_id, :integer
    add_column :proposals, :worker_id, :integer
    
    add_foreign_key :proposals, :requests
    add_foreign_key :proposals, :workers
    
    
    add_index :proposals, :request_id
    add_index :proposals, :worker_id
  end
end
