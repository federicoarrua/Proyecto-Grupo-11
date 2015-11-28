class AddPuntajeToCouches < ActiveRecord::Migration
  def change
    add_column :couches, :punt, :integer
    add_column :couches, :cant, :integer
  end
end
