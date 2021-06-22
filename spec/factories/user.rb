FactoryBot.define do
    factory :user, aliases: [:regular_usr] do
        username { 'danny' }
        email { 'danny@mail.com' }
        password { "pa$$word" }
        password_confirmation { "pa$$word" }
        role { 'user' }
    end
end