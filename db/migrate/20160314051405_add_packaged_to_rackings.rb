class AddPackagedToRackings < ActiveRecord::Migration[5.2]
  def change
    add_column :rackings, :packaged, :boolean, default: false
  end
end
