class AddProviderToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :provider, :string
    add_column :workers, :uid, :string
  end
end
