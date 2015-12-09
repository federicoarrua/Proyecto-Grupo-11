class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :contenido
	  t.boolean :check, default: false
      t.belongs_to :couch
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
