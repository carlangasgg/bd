class ModificarTablaTropas < ActiveRecord::Migration
  def change
  	remove_column :tropas, :num_guerreros, :integer
  	add_column :tropas, :recurso, :string
  end
end
