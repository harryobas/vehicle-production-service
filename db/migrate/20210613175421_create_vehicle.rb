class CreateVehicle < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :current_state
      t.text :states, array: true, default: []

      t.timestamps
    end
  end
end
