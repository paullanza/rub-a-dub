class AddCoordinatesAndAddressToTubs < ActiveRecord::Migration[7.1]
  def change
    add_column :tubs, :address, :string
    add_column :tubs, :latitude, :float
    add_column :tubs, :longitude, :float
  end
end
