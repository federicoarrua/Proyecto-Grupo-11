class AddBorradoTipo < ActiveRecord::Migration
  
  def change
		add_column :tipos, :borrado, :boolean, default: false
  end

end
