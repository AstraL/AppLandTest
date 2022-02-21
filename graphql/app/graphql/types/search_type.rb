module Types
  class Types::SearchType < Types::BaseObject
    field :status, String, null: true
    field :response,  GraphQL::Types::JSON, null: true

    def response
      object
    end

    def status
      object.present? ? "Successful" : "Something went wrong"
    end
  end
end