class AddCuentaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cuenta, :string
  end
end
