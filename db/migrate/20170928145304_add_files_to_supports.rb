class AddFilesToSupports < ActiveRecord::Migration[5.1]
  def up
    add_attachment :supports, :document
  end
  def down
    remove_attachment :supports, :document
  end
end
