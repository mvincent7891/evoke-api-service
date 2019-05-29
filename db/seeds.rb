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

definition_d.synonyms.create(synonym: definition_a.term)
definition_a.synonyms.create(synonym: definition_d.term)

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
        term: "trust",
        definition: "commercial credit",
        lexical_category: "noun",
        source: "oxford",
    },
    {
        term: "trust",
        definition: "an arrangement whereby a person (a trustee) holds property as its nominal owner for the good of one  one or more beneficiaries",
        lexical_category: "noun",
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
    {antonym: "cautious", definition_id: 3},
    {antonym: "considered", definition_id: 3},
    {antonym: "sluggish", definition_id: 3},
    {antonym: "weak", definition_id: 3},
    {antonym: "distrust", definition_id: 6},
    {antonym: "mistrust", definition_id: 6},
    {antonym: "scepticism", definition_id: 6},
    {antonym: "doubt", definition_id: 6},
    {antonym: "distrust", definition_id: 7},
    {antonym: "mistrust", definition_id: 7},
    {antonym: "scepticism", definition_id: 7},
    {antonym: "doubt", definition_id: 7},
    {antonym: "keen", definition_id: 8},
    {antonym: "systematic", definition_id: 8},
    {antonym: "lasting", definition_id: 8}
].each do |antonym|
    Antonym.create(
        definition_id: antonym[:definition_id],
        antonym:  antonym[:antonym]
    )
 end

 [
    {synonym: "quench", definition_id: 1},
    {synonym: "satisfy", definition_id: 1},
    {synonym: "take the edge off", definition_id: 1},
    {synonym: "sate", definition_id: 1},
    {synonym: "satiate", definition_id: 1},
    {synonym: "relieve", definition_id: 1},
    {synonym: "assuage", definition_id: 1},
    {synonym: "gratify", definition_id: 1},
    {synonym: "satisfy", definition_id: 2},
    {synonym: "slake", definition_id: 2},
    {synonym: "sate", definition_id: 2},
    {synonym: "satiate", definition_id: 2},
    {synonym: "gratify", definition_id: 2},
    {synonym: "relieve", definition_id: 2},
    {synonym: "assuage", definition_id: 2},
    {synonym: "take the edge off", definition_id: 2},
    {synonym: "appease", definition_id: 2},
    {synonym: "meet", definition_id: 2},
    {synonym: "fulfil", definition_id: 2},
    {synonym: "indulge", definition_id: 2},
    {synonym: "extinguish", definition_id: 2},
    {synonym: "put out", definition_id: 2},
    {synonym: "snuff out", definition_id: 2},
    {synonym: "smother", definition_id: 2},
    {synonym: "douse", definition_id: 2},
    {synonym: "dampen down", definition_id: 2},
    {synonym: "impulsive", definition_id: 3},
    {synonym: "rash", definition_id: 3},
    {synonym: "hasty", definition_id: 3},
    {synonym: "overhasty", definition_id: 3},
    {synonym: "reckless", definition_id: 3},
    {synonym: "heedless", definition_id: 3},
    {synonym: "foolhardy", definition_id: 3},
    {synonym: "incautious", definition_id: 3},
    {synonym: "imprudent", definition_id: 3},
    {synonym: "injudicious", definition_id: 3},
    {synonym: "ill-conceived", definition_id: 3},
    {synonym: "ill-considered", definition_id: 3},
    {synonym: "unplanned", definition_id: 3},
    {synonym: "unreasoned", definition_id: 3},
    {synonym: "unthought-out", definition_id: 3},
    {synonym: "unthinking", definition_id: 3},
    {synonym: "torrential", definition_id: 3},
    {synonym: "powerful", definition_id: 3},
    {synonym: "forceful", definition_id: 3},
    {synonym: "vigorous", definition_id: 3},
    {synonym: "violent", definition_id: 3},
    {synonym: "raging", definition_id: 3},
    {synonym: "rampant", definition_id: 3},
    {synonym: "relentless", definition_id: 3},
    {synonym: "unrestrained", definition_id: 3},
    {synonym: "uncontrolled", definition_id: 3},
    {synonym: "unbridled", definition_id: 3},
    {synonym: "green", definition_id: 5},
    {synonym: "leafy", definition_id: 5},
    {synonym: "grassy", definition_id: 5},
    {synonym: "grass-covered", definition_id: 5},
    {synonym: "confidence", definition_id: 6},
    {synonym: "belief", definition_id: 6},
    {synonym: "faith", definition_id: 6},
    {synonym: "freedom from doubt", definition_id: 6},
    {synonym: "freedom from suspicion", definition_id: 6},
    {synonym: "sureness", definition_id: 6},
    {synonym: "certainty", definition_id: 6},
    {synonym: "certitude", definition_id: 6},
    {synonym: "assurance", definition_id: 6},
    {synonym: "conviction", definition_id: 6},
    {synonym: "credence", definition_id: 6},
    {synonym: "reliance", definition_id: 6},
    {synonym: "responsibility", definition_id: 6},
    {synonym: "duty", definition_id: 6},
    {synonym: "obligation", definition_id: 6},
    {synonym: "safe keeping", definition_id: 6},
    {synonym: "keeping", definition_id: 6},
    {synonym: "protection", definition_id: 6},
    {synonym: "charge", definition_id: 6},
    {synonym: "care", definition_id: 6},
    {synonym: "custody", definition_id: 6},
    {synonym: "have faith in", definition_id: 6},
    {synonym: "place one's trust in", definition_id: 6},
    {synonym: "put one's trust in", definition_id: 6},
    {synonym: "have confidence in", definition_id: 6},
    {synonym: "have every confidence in", definition_id: 6},
    {synonym: "believe in", definition_id: 6},
    {synonym: "pin one's faith on", definition_id: 6},
    {synonym: "pin one's hopes on", definition_id: 6},
    {synonym: "hope", definition_id: 6},
    {synonym: "expect", definition_id: 6},
    {synonym: "think likely", definition_id: 6},
    {synonym: "dare say", definition_id: 6},
    {synonym: "imagine", definition_id: 6},
    {synonym: "believe", definition_id: 6},
    {synonym: "assume", definition_id: 6},
    {synonym: "presume", definition_id: 6},
    {synonym: "suppose", definition_id: 6},
    {synonym: "take it", definition_id: 6},
    {synonym: "entrust", definition_id: 6},
    {synonym: "put in the hands of", definition_id: 6},
    {synonym: "allow to look after", definition_id: 6},
    {synonym: "allow to look use", definition_id: 6},
    {synonym: "consign", definition_id: 6},
    {synonym: "commit", definition_id: 6},
    {synonym: "give", definition_id: 6},
    {synonym: "hand over", definition_id: 6},
    {synonym: "turn over", definition_id: 6},
    {synonym: "assign", definition_id: 6},
    {synonym: "commend", definition_id: 6},
    {synonym: "confidence", definition_id: 7},
    {synonym: "belief", definition_id: 7},
    {synonym: "faith", definition_id: 7},
    {synonym: "freedom from doubt", definition_id: 7},
    {synonym: "freedom from suspicion", definition_id: 7},
    {synonym: "sureness", definition_id: 7},
    {synonym: "certainty", definition_id: 7},
    {synonym: "certitude", definition_id: 7},
    {synonym: "assurance", definition_id: 7},
    {synonym: "conviction", definition_id: 7},
    {synonym: "credence", definition_id: 7},
    {synonym: "reliance", definition_id: 7},
    {synonym: "responsibility", definition_id: 7},
    {synonym: "duty", definition_id: 7},
    {synonym: "obligation", definition_id: 7},
    {synonym: "safe keeping", definition_id: 7},
    {synonym: "keeping", definition_id: 7},
    {synonym: "protection", definition_id: 7},
    {synonym: "charge", definition_id: 7},
    {synonym: "care", definition_id: 7},
    {synonym: "custody", definition_id: 7},
    {synonym: "have faith in", definition_id: 7},
    {synonym: "place one's trust in", definition_id: 7},
    {synonym: "put one's trust in", definition_id: 7},
    {synonym: "have confidence in", definition_id: 7},
    {synonym: "have every confidence in", definition_id: 7},
    {synonym: "believe in", definition_id: 7},
    {synonym: "pin one's faith on", definition_id: 7},
    {synonym: "pin one's hopes on", definition_id: 7},
    {synonym: "hope", definition_id: 7},
    {synonym: "expect", definition_id: 7},
    {synonym: "think likely", definition_id: 7},
    {synonym: "dare say", definition_id: 7},
    {synonym: "imagine", definition_id: 7},
    {synonym: "believe", definition_id: 7},
    {synonym: "assume", definition_id: 7},
    {synonym: "presume", definition_id: 7},
    {synonym: "suppose", definition_id: 7},
    {synonym: "take it", definition_id: 7},
    {synonym: "entrust", definition_id: 7},
    {synonym: "put in the hands of", definition_id: 7},
    {synonym: "allow to look after", definition_id: 7},
    {synonym: "allow to look use", definition_id: 7},
    {synonym: "consign", definition_id: 7},
    {synonym: "commit", definition_id: 7},
    {synonym: "give", definition_id: 7},
    {synonym: "hand over", definition_id: 7},
    {synonym: "turn over", definition_id: 7},
    {synonym: "assign", definition_id: 7},
    {synonym: "commend", definition_id: 7},
    {synonym: "casual", definition_id: 8},
    {synonym: "half-hearted", definition_id: 8},
    {synonym: "lukewarm", definition_id: 8},
    {synonym: "cursory", definition_id: 8},
    {synonym: "superficial", definition_id: 8},
    {synonym: "token", definition_id: 8},
    {synonym: "perfunctory", definition_id: 8},
    {synonym: "passing", definition_id: 8},
    {synonym: "incidental", definition_id: 8},
    {synonym: "sketchy", definition_id: 8},
    {synonym: "haphazard", definition_id: 8},
    {synonym: "random", definition_id: 8},
    {synonym: "aimless", definition_id: 8},
    {synonym: "rambling", definition_id: 8},
    {synonym: "erratic", definition_id: 8},
    {synonym: "unmethodical", definition_id: 8},
    {synonym: "unsystematic", definition_id: 8},
    {synonym: "automatic", definition_id: 8},
    {synonym: "unthinking", definition_id: 8},
    {synonym: "capricious", definition_id: 8},
    {synonym: "mechanical", definition_id: 8},
    {synonym: "offhand", definition_id: 8},
    {synonym: "chaotic", definition_id: 8},
    {synonym: "inconsistent", definition_id: 8},
    {synonym: "irregular", definition_id: 8},
    {synonym: "intermittent", definition_id: 8},
    {synonym: "occasional", definition_id: 8},
    {synonym: "sporadic", definition_id: 8},
    {synonym: "inconstant", definition_id: 8},
    {synonym: "fitful", definition_id: 8}
].each do |synonym|
    Synonym.create(
        definition_id: synonym[:definition_id],
        synonym:  synonym[:synonym]
    )
 end