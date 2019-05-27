FactoryBot.define do
  factory :antonym do
    association :definition, factory: :definition
    sequence(:antonym) { |n| "#{Faker::Lorem.word}-#{n}"}
  end
end