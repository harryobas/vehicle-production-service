class CreateUser 
    def call 
        user = User.create(context)
        context.user = user if user.persisted?
    rescue ActiveRecord::RecordIvalid => e 
        context.fail!(message: e.message)
    end

end