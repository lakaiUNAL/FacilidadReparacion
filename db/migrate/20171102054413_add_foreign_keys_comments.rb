class AddForeignKeysComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :customer_id, :integer
    add_column :comments, :worker_id, :integer
    
    add_foreign_key :comments, :customers
    add_foreign_key :comments, :workers
    
    
    add_index :comments, :customer_id
    add_index :comments, :worker_id
  end
end
