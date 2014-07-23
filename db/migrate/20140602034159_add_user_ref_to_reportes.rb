class AddUserRefToReportes < ActiveRecord::Migration
  def change
    add_reference :reportes, :user, index: true
  end
end
