# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# create 2 Collections
collection_a = Collection.create(title: 'Default')
collection_b = Collection.create(title: 'Hamilton')

definition_a = Definition.create(
    term: 'slake',
    definition: 'to quench or satisfy',
    lexical_category: 'verb',
    source: 'user'
)
definition_a.entries.create(collection: collection_a)

definition_d = Definition.create(
    term: 'quench',
    definition: 'satisfy (one\'s thirst) by drinking',
    lexical_category: 'verb',
    source: 'user'
)

definition_d.entries.create(collection: collection_a)

definition_b = Definition.create(
    term: 'impetuous',
    definition: 'acting or done quickly and without thought or care',
    lexical_category: 'adjective',
    source: 'user'
)
definition_b.entries.create(collection: collection_a)
definition_b.entries.create(collection: collection_b)

definition_c = Definition.create(
    term: 'worsted',
    definition: 'a fine smooth yarn spun from combed long-staple wool',
    lexical_category: 'noun',
    source: 'user'
)
definition_c.entries.create(collection: collection_b)

[
    {
        term: "verdant",
        definition: "(of countryside) green with grass or other rich vegetation",
        lexical_category: "adjective",
        source: "oxford",
    },
    {
        term: "desultory",
        definition: "lacking a plan, purpose, or enthusiasm",
        lexical_category: "adjective",
        source: "oxford",
    }
].each do |definition|
    new_definition = Definition.create(
        term: definition[:term],
        definition: definition[:definition],
        lexical_category: definition[:lexical_category],
        source: definition[:source]
    )
    new_definition.entries.create(collection: collection_a)
end

[
    {antonym: "cautious", term: "impetuous"},
    {antonym: "considered", term: "impetuous"},
    {antonym: "sluggish", term: "impetuous"},
    {antonym: "weak", term: "impetuous"},
    {antonym: "keen", term: "desultory"},
    {antonym: "systematic", term: "desultory"},
    {antonym: "lasting", term: "desultory"}
].each do |antonym|
    Antonym.create(
        term: antonym[:term],
        antonym:  antonym[:antonym]
    )
 end

 [
    {synonym: "quench", term: "slake"},
    {synonym: "satisfy", term: "slake"},
    {synonym: "take the edge off", term: "slake"},
    {synonym: "sate", term: "slake"},
    {synonym: "satiate", term: "slake"},
    {synonym: "relieve", term: "slake"},
    {synonym: "assuage", term: "slake"},
    {synonym: "gratify", term: "slake"},
    {synonym: "satisfy", term: "quench"},
    {synonym: "slake", term: "quench"},
    {synonym: "sate", term: "quench"},
    {synonym: "satiate", term: "quench"},
    {synonym: "gratify", term: "quench"},
    {synonym: "relieve", term: "quench"},
    {synonym: "assuage", term: "quench"},
    {synonym: "take the edge off", term: "quench"},
    {synonym: "appease", term: "quench"},
    {synonym: "meet", term: "quench"},
    {synonym: "fulfil", term: "quench"},
    {synonym: "indulge", term: "quench"},
    {synonym: "extinguish", term: "quench"},
    {synonym: "put out", term: "quench"},
    {synonym: "snuff out", term: "quench"},
    {synonym: "smother", term: "quench"},
    {synonym: "douse", term: "quench"},
    {synonym: "dampen down", term: "quench"},
    {synonym: "impulsive", term: "impetuous"},
    {synonym: "rash", term: "impetuous"},
    {synonym: "hasty", term: "impetuous"},
    {synonym: "overhasty", term: "impetuous"},
    {synonym: "reckless", term: "impetuous"},
    {synonym: "heedless", term: "impetuous"},
    {synonym: "foolhardy", term: "impetuous"},
    {synonym: "incautious", term: "impetuous"},
    {synonym: "imprudent", term: "impetuous"},
    {synonym: "injudicious", term: "impetuous"},
    {synonym: "ill-conceived", term: "impetuous"},
    {synonym: "ill-considered", term: "impetuous"},
    {synonym: "unplanned", term: "impetuous"},
    {synonym: "unreasoned", term: "impetuous"},
    {synonym: "unthought-out", term: "impetuous"},
    {synonym: "unthinking", term: "impetuous"},
    {synonym: "torrential", term: "impetuous"},
    {synonym: "powerful", term: "impetuous"},
    {synonym: "forceful", term: "impetuous"},
    {synonym: "vigorous", term: "impetuous"},
    {synonym: "violent", term: "impetuous"},
    {synonym: "raging", term: "impetuous"},
    {synonym: "rampant", term: "impetuous"},
    {synonym: "relentless", term: "impetuous"},
    {synonym: "unrestrained", term: "impetuous"},
    {synonym: "uncontrolled", term: "impetuous"},
    {synonym: "unbridled", term: "impetuous"},
    {synonym: "green", term: "verdant"},
    {synonym: "leafy", term: "verdant"},
    {synonym: "grassy", term: "verdant"},
    {synonym: "grass-covered", term: "verdant"},
    {synonym: "casual", term: "desultory"},
    {synonym: "half-hearted", term: "desultory"},
    {synonym: "lukewarm", term: "desultory"},
    {synonym: "cursory", term: "desultory"},
    {synonym: "superficial", term: "desultory"},
    {synonym: "token", term: "desultory"},
    {synonym: "perfunctory", term: "desultory"},
    {synonym: "passing", term: "desultory"},
    {synonym: "incidental", term: "desultory"},
    {synonym: "sketchy", term: "desultory"},
    {synonym: "haphazard", term: "desultory"},
    {synonym: "random", term: "desultory"},
    {synonym: "aimless", term: "desultory"},
    {synonym: "rambling", term: "desultory"},
    {synonym: "erratic", term: "desultory"},
    {synonym: "unmethodical", term: "desultory"},
    {synonym: "unsystematic", term: "desultory"},
    {synonym: "automatic", term: "desultory"},
    {synonym: "unthinking", term: "desultory"},
    {synonym: "capricious", term: "desultory"},
    {synonym: "mechanical", term: "desultory"},
    {synonym: "offhand", term: "desultory"},
    {synonym: "chaotic", term: "desultory"},
    {synonym: "inconsistent", term: "desultory"},
    {synonym: "irregular", term: "desultory"},
    {synonym: "intermittent", term: "desultory"},
    {synonym: "occasional", term: "desultory"},
    {synonym: "sporadic", term: "desultory"},
    {synonym: "inconstant", term: "desultory"},
    {synonym: "fitful", term: "desultory"}
].each do |synonym|
    Synonym.create(
        term: synonym[:term],
        synonym:  synonym[:synonym]
    )
 end