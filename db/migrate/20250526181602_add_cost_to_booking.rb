class AddCostToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :cost, :integer
  end
end
