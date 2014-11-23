class AgregarDatosDefaultUser < ActiveRecord::Migration
  def change
  	change_column :users, :partidas_ganadas, :integer, default: 0
  	change_column :users, :partidas_perdidas, :integer, default: 0
  	change_column :users, :nivel, :integer, default: 1
  	change_column :users, :puntos_experiencia, :integer, default: 0
  end
end
