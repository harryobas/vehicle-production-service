class AddTimestampsToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :created_at, :datetime, null: false
    add_column :vehicles, :updated_at, :datetime, null: false
  end
end
