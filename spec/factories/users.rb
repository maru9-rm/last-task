FactoryBot.define do
    factory :user do
        user_name { Faker::Internet.user_name }
        email { Faker::Internet.email }
        password { 'password' }
    end
end