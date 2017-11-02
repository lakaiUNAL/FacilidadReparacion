class AddForeignKeysRequests < ActiveRecord::Migration[5.1]
  def change
    
    add_column :requests, :customer_id, :integer
    add_column :requests, :service_id, :integer
    
    add_foreign_key :requests, :customers
    add_foreign_key :requests, :services
    
    
    add_index :requests, :customer_id
    add_index :requests, :service_id
  end
end
