module Types
  class MutationType < Types::BaseObject
    field :search, mutation: Mutations::Search
  end
end