class AddDefaultStatusToSoaks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :soaks, :status, from: nil, to: "pending"
  end
end
