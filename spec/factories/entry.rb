FactoryBot.define do
  factory :entry do
    association :collection, factory: :collection
    association :item, factory: :definition
  end
end