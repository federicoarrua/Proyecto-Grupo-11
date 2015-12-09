class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :contenido
      t.belongs_to :pregunta
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
