class GetVehicle 
    include Interactor

    def call 
        vehicle = Vehicle.find(context.id)
        context.vehicle = vehicle  
    rescue ActiveRecord::RecordNotFound => e 
        context.fail!(message: e.message)
    end
end