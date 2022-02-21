module Mutations
  class Search < Mutations::BaseMutation
    argument :need_name, Boolean, required: false
    argument :event_sql, String, required: false, validates: { length: { minimum: 3 } }
    argument :package_name, String, required: false, validates: { length: { minimum: 3 } }
    argument :json_file, ApolloUploadServer::Upload, required: true

    field :search, Types::SearchType, null: true
    field :errors, [String], null: true

    def resolve(input)
      file = File.read(input[:json_file].path)
      @json_file = JSON.parse(file)

      @response = {}
      @response[:name] = @json_file["metadata"]["name"] if input[:need_name]

      search_classes(input[:package_name]) if (input[:package_name])
      search_event(input[:event_sql]) if (input[:event_sql])

      { search: @response }
    end

    private

    def search_classes(package_name)
      @response[:classes] = @json_file["classMap"]&.select { |package| package if package["name"] === package_name }
    end

    def search_event(event_sql)
      @response[:events] = @json_file["events"]&.select do |event|
        event if event["sql_query"] && event["sql_query"]["sql"].include?(event_sql)
      end
    end
  end
end
