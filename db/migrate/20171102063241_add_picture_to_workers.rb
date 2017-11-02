class AddPictureToWorkers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :workers, :picture
    add_attachment :customers, :picture
  end
  
  def down
    remove_attachment :workers, :picture
    remove_attachment :customers, :picture
  end
  
end
