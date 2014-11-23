class AgregarAtributosRecursosTropas < ActiveRecord::Migration
  def change
  	add_column :recursos_users, :cantidad, :integer, default: 0

  end
end
