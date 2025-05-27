class CreateSoaks < ActiveRecord::Migration[7.1]
  def change
    create_table :soaks do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :cost
      t.references :user, null: false, foreign_key: true
      t.references :tub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
