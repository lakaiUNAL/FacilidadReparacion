class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.belongs_to :worker, index: true
      t.belongs_to :customer, index: true
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
