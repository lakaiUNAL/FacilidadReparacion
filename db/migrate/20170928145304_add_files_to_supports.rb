class AddFilesToSupports < ActiveRecord::Migration[5.1]
  def up
    add_attachment :supports, :file
  end
  def up
    remove_attachment :supports, :file
  end
end
