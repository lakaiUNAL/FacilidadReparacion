class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :service, index: true
      t.string :article
      t.text :description

      t.timestamps
    end

    add_foreign_key :requests, :customers
    add_foreign_key :requests, :services

  end
end
