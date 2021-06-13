class CreateVehicleStateMachine < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_state_machines do |t|
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
