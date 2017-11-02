class AddForeignKeysSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :customer_id, :integer
    add_column :schedules, :worker_id, :integer
    add_column :schedules, :service_id, :integer
    
    add_foreign_key :schedules, :customers
    add_foreign_key :schedules, :workers
    add_foreign_key :schedules, :services
    
    
    add_index :schedules, :customer_id
    add_index :schedules, :worker_id
    add_index :schedules, :service_id
  end
end
