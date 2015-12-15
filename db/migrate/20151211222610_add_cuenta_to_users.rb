class AddCuentaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium, :boolean
    add_column :users, :fechaP, :date
  end
end
