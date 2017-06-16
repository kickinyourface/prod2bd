class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.integer :cod_prov
      t.string :nom_prov
      t.string :dir_prov
      t.string :tel_prov

      t.timestamps null: false
    end
  end
end
