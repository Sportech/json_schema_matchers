require 'json_schema_matchers'

if RSpec.respond_to?(:configure)
  RSpec::Matchers.define :match_response_schema do |schema, **options|
    matcher = JsonSchemaMatchers::Matcher.new(schema, options)

    match do |response|
      matcher.matches?(response)
    end

    if respond_to?(:failure_message)
      failure_message do |_response|
        matcher.validation_failure_message
      end
    else
      failure_message_for_should do |_response|
        matcher.validation_failure_message
      end
    end
  end
end
