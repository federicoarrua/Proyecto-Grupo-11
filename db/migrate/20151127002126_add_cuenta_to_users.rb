class AddCuentaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium, :boolean, default: false
	add_column :users, :fechaPremium, :date
  end
end
