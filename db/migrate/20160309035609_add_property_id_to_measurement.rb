class AddPropertyIdToMeasurement < ActiveRecord::Migration[5.2]
  def change
    add_column :measurements, :property_id, :integer
  end
end
