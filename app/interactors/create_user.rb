class CreateUser 
    include Interactor
    def call
        uname = context.username
        email = context.email
        pass = context.password
        pass_confirmation = context.password_confirmation
        role = context.role 

        user = User.create!(
            username: uname,
            email: email,
            password: pass,
            password_confirmation: pass_confirmation,
            role: role
        )
        context.user = user if user.persisted?
    rescue ActiveRecord::RecordInvalid => e 
        context.fail!(message: e.message)
    end

end