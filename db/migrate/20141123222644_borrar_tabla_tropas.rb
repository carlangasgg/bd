class BorrarTablaTropas < ActiveRecord::Migration
  def self.down
    drop_table :tropas
  end
end
