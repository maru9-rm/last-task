FactoryBot.define do
    factory :article do
        content { Faker::Lorem.characters(number: 100) }
    end
end