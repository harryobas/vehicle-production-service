class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :current_state, :states
end
