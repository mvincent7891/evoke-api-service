FactoryBot.define do
  factory :antonym do
    sequence(:term) { |n| "#{Faker::Lorem.word}-#{n}"}
    sequence(:antonym) { |n| "#{Faker::Lorem.word}-#{n}"}
  end
end