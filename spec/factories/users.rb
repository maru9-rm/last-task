FactoryBot.define do
    factory :user do
        user_name { Faker::Internet.user_name }
        email { Faker::Internet.email }
        password { 'password' }

        trait :with_profile do
            after :build do |user|
                build(:profile, user: user)
            end
        end
    end
end