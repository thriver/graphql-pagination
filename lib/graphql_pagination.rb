require 'graphql_pagination/version'
require 'graphql'
require 'graphql/schema/object'

module GraphqlPagination
  class << self
    attr_accessor :collection_type_suffix

    def collection_type_name
      return @collection_type_name if defined?(@collection_type_name)

      @collection_type_name = ->(field_type_name) { "#{field_type_name}#{collection_type_suffix}" }
    end

    def collection_type_name=(value)
      fail ArgumentError, 'collection_type_name must be callable' unless value.respond_to?(:call)

      @collection_type_name = value
    end
  end
end

require 'graphql_pagination/collection_base_error'
require 'graphql_pagination/collection_type'
require 'graphql_pagination/collection_metadata_type'

GraphQL::Schema::Object.extend GraphqlPagination::CollectionType
