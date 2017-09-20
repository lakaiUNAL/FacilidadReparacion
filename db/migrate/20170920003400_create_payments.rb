class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :customer, index: true # crea un campo llamado 'customer_id'
      t.belongs_to :worker, index: true # crea un campo llamado 'worker_id'
      t.integer :amount

      t.timestamps
    end

    add_foreign_key :payments, :customers
    add_foreign_key :payments, :workers

  end
end
