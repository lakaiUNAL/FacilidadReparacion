class AddLatAndLongToWorker < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :latitude, :float
    add_column :workers, :longitude, :float
  end
end
