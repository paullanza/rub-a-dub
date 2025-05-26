class CreateTubs < ActiveRecord::Migration[7.1]
  def change
    create_table :tubs do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :size
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
