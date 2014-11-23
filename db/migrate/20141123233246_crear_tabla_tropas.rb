class CrearTablaTropas < ActiveRecord::Migration
  	def change
    create_table :tropas do |t|
      t.string :nombre
      t.integer :costo
      t.integer :ataque
      t.integer :defensa
      t.integer :num_guerreros
      t.text :historia

      t.timestamps null: false
    end
  end  
end
