FactoryBot.define do
  factory :synonym do
    association :definition, factory: :definition
    association :synonym, factory: :definition
  end
end