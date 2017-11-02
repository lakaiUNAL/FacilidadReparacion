class AddForeignKeysSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :service_id, :integer
    add_column :skills, :worker_id, :integer
    
    add_foreign_key :skills, :services
    add_foreign_key :skills, :workers
    
    
    add_index :skills, :service_id
    add_index :skills, :worker_id
  end
end
