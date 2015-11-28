class AddPuntajeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :punt, :integer
    add_column :users, :cant, :integer
  end
end
