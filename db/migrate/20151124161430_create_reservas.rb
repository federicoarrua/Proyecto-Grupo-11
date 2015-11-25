class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :nombre_id
      t.integer :couch_id
      t.date :ingreso
      t.date :salida
      t.string :estado

      t.timestamps null: false
    end
  end
end
