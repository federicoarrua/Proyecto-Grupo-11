class CreateUpuntajes < ActiveRecord::Migration
  def change
    create_table :upuntajes do |t|
      t.integer :origen
      t.integer :destino
      t.integer :puntaje

      t.timestamps null: false
    end
  end
end
