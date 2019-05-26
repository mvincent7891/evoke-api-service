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