class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.belongs_to :worker, index: true
      t.belongs_to :service, index:true
      t.timestamps
    end
    add_foreign_key :skills, :workers
    add_foreign_key :skills, :services
  end
end
