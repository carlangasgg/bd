class ModificarDatosDefaultUser < ActiveRecord::Migration
  def change
  	add_column :users, :permiso, :string, default: "usuario"
  end
end
