FactoryBot.define do
    factory :definition do
        sequence(:term) { |n| "#{Faker::Lorem.word}-#{n}"}
    end
  end