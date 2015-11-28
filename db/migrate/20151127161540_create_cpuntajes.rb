class CreateCpuntajes < ActiveRecord::Migration
  def change
    create_table :cpuntajes do |t|
      t.integer :origen
      t.integer :couch
      t.integer :puntaje

      t.timestamps null: false
    end
  end
end
