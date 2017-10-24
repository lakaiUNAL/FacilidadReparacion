class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
    	t.belongs_to :worker, index: true
      t.belongs_to :request, index:true
      t.timestamps
    end
    add_foreign_key :skills, :workers
    add_foreign_key :skills, :requests
  end
end
