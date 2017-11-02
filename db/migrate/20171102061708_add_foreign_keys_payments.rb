class AddForeignKeysPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :customer_id, :integer
    add_column :payments, :worker_id, :integer
    
    add_foreign_key :payments, :customers
    add_foreign_key :payments, :workers
    
    
    add_index :payments, :customer_id
    add_index :payments, :worker_id
  end
end
