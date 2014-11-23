class CrearTablaTropasUsuario < ActiveRecord::Migration
  def change
  	  create_table :tropas_users, :id => false do |t|
      t.references :tropa
      t.references :user
    end
    add_index :tropas_users, :tropa_id
    add_index :tropas_users, :user_id
  end
end
