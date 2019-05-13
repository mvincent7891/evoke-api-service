FactoryBot.define do
    factory :collection do
      sequence(:title) { |n| "#{Faker::Lorem.word}-#{n}"}
    end
  end