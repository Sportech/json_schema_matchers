require 'json-schema'

module JsonSchemaMatchers
  class Matcher
    attr_reader :validation_failure_message

    def initialize(schema_name, options)
      @schema_path = build_schema_path(schema_name)
      @options = default_options.merge(options)
    end

    def matches?(response)
      json_response = response.respond_to?(:body) ? response.body : response

      JSON::Validator.validate!(@schema_path, json_response, @options)
    rescue JSON::Schema::ValidationError => e
      @validation_failure_message = e.message
      false
    end

    private

    def build_schema_path(schema_name)
      Pathname(JsonSchemaMatchers.config.schema_root).join("#{schema_name}.json").to_s
    end

    def default_options
      JsonSchemaMatchers.config.options
    end
  end
end
