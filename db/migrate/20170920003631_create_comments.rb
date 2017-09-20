class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :customer, index: true # crea un campo llamado 'customer_id'
      t.belongs_to :worker, index: true # crea un campo llamado 'worker_id'
      t.text :contents

      t.timestamps
    end

    add_foreign_key :comments, :workers
    add_foreign_key :comments, :customers

  end
end
