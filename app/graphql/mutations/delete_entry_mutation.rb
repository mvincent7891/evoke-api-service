module Mutations
  DeleteEntryMutation = GraphQL::ObjectType.define do
    name 'DeleteEntryMutation'
    description 'Mutation type for deleting entry'

    field :delete_entry, Types::EntryType do
      argument :id, !types.Int

      resolve ->(_obj, args, _ctx) do
        entry = Entry.find(args[:id])
        entry.delete
        entry
      end
    end
  end
end