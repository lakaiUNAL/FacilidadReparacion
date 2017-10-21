class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.belongs_to :worker, index: true
      t.belongs_to :customer, index: true
      t.belongs_to :request, index: true

      t.timestamps
    end
    add_foreign_key :schedules, :workers
    add_foreign_key :schedules, :customers
    add_foreign_key :schedules, :requests
  end
end
