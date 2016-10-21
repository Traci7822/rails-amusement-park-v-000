class AddAttractionIdToRides < ActiveRecord::Migration
  def change
    add_column :rides, :attraction_id, :integer
  end
end
