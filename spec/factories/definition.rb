FactoryBot.define do
    factory :definition do
        sequence(:term) { |n| "#{Faker::Lorem.word}-#{n}"}
        definition Faker::Lorem.sentence
        lexical_category {'noun'}
        source {'user'}
    end
  end