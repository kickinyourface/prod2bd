class CreateAlmacens < ActiveRecord::Migration
  def change
    create_table :almacens do |t|
      t.integer :COD_ALMACEN
      t.string :NOM_ALMACEN
      t.string :DIR_ALMACEN
      t.integer :TEL_ALMACEN

      t.timestamps null: false
    end
  end
end
