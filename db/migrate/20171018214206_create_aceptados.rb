class CreateAceptados < ActiveRecord::Migration[5.1]
  def change
    create_table :aceptados do |t|
      t.integer :client
      t.integer :tecnic

      t.timestamps
    end
  end
end
