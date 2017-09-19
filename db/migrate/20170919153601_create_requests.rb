class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :customer_id
      t.string :article
      t.string :service_tipe
      t.text :description
      t.text :address

      t.timestamps
    end
  end
end
