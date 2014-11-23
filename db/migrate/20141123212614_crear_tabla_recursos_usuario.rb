class CrearTablaRecursosUsuario < ActiveRecord::Migration
  def change
  	  create_table :recursos_users, :id => false do |t|
      t.references :recurso
      t.references :user
    end
    add_index :recursos_users, :recurso_id
    add_index :recursos_users, :user_id
  end
end
