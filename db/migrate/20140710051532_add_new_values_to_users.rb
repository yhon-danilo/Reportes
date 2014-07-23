class AddNewValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellido1, :string
    add_column :users, :apellido2, :string
  end
end
