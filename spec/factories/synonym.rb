FactoryBot.define do
  factory :synonym do
    sequence(:term) { |n| "#{Faker::Lorem.word}-#{n}"}
    sequence(:synonym) { |n| "#{Faker::Lorem.word}-#{n}"}
  end
end