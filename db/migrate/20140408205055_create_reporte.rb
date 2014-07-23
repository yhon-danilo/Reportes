class CreateReporte < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido1
      t.string :apellido2
      t.string :dependencia
      t.string :telefono
      t.string :asociado
      t.string :resultado
      t.string :referido

      t.timestamps
    end
  end
end
