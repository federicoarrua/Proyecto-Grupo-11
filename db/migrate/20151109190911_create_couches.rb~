class CreateCouches < ActiveRecord::Migration
  def change
    create_table :couches do |t|
      t.integer :capacidad
      t.text :descripcion
      t.string :imageurl
	  t.belongs_to :tipo, index: true
	  t.belongs_to :user
	  
      t.timestamps null: false
    end
  end
end
