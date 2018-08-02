class RemoveNameFromMeasurement < ActiveRecord::Migration[5.2]
  def change
    remove_column :measurements, :name
  end
end
