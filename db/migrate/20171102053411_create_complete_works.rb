class CreateCompleteWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :complete_works do |t|
      t.text :calificacion
      t.text :comentario

      t.timestamps
    end
  end
end
