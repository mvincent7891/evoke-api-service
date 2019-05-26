FactoryBot.define do
  factory :synonym do
    association :definition, factory: :definition
    sequence(:synonym) { |n| "#{Faker::Lorem.word}-#{n}"}
  end
end