class AddCoordinatesToAssos < ActiveRecord::Migration[6.0]
  def change
    add_column :assos, :latitude, :float
    add_column :assos, :longitude, :float
  end
end
