class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :article
      t.text :description

      t.timestamps
    end
  end
end
