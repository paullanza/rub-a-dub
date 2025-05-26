class RenameTypeToCategoryForTubs < ActiveRecord::Migration[7.1]
  def change
    rename_column :tubs, :type, :category
  end
end
