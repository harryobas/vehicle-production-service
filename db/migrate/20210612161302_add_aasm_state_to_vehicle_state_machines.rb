class AddAasmStateToVehicleStateMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicle_state_machines, :aasm_state, :string 
  end
end
