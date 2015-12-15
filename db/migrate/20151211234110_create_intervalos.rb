class CreateIntervalos < ActiveRecord::Migration
  def change
    create_table :intervalos do |t|
      t.date :inicio
      t.date :fin
      t.integer :uso

      t.timestamps null: false
    end
  end
end
