class AddDateToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :fecha_servicio, :date
  end
end
