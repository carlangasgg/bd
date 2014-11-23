class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :puntos_experiencia
      t.integer :nivel
      t.integer :partidas_ganadas
      t.integer :partidas_perdidas

      t.timestamps null: false
    end
  end
end
