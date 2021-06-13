class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :current_state
      t.text :states, array: true, default: []
    end
  end
end
