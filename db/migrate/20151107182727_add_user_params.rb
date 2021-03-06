class AddUserParams < ActiveRecord::Migration
  def change
	add_column :users, :nombre, :string
	add_column :users, :apellido, :string
	add_column :users, :pais, :string
	add_column :users, :fecha, :date
	add_column :users, :admin, :boolean, default: false
  end
end
