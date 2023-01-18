module GraphqlPagination
  class Configuration
    attr_accessor :collection_type_suffix
    attr_reader :collection_type_name

    def initialize
      @collection_type_suffix = 'Collection'
      @collection_type_name = ->(field_type) { "#{field_type.graphql_name}#{@collection_type_suffix}" }
    end

    def collection_type_name=(value)
      fail ArgumentError, "collection_type_name must be a Proc" unless value.is_a?(Proc)

      @collection_type_name = value
    end
  end
end
