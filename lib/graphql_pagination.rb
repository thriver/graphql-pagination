require 'graphql_pagination/version'
require 'graphql'
require 'graphql/schema/object'

require 'graphql_pagination/configuration'

module GraphqlPagination
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end

require 'graphql_pagination/collection_base_error'
require 'graphql_pagination/collection_type'
require 'graphql_pagination/collection_metadata_type'

GraphQL::Schema::Object.extend GraphqlPagination::CollectionType
