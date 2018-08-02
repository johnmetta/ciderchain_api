class AddSourceIdToAddition < ActiveRecord::Migration[5.2]
  def change
    add_column :additions, :source_id, :integer
  end
end
