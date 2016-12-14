module JsonSchemaMatchers
  class << self
    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end
  end

  class Config
    DEFAULT_SCHEMA_ROOT = "#{Dir.pwd}/spec/json_schemas".freeze
    DEFAULT_OPTIONS = {version: :draft4,
                       insert_defaults: true,
                       validate_schema: true}

    attr_accessor :options, :schema_root

    def initialize
      @schema_root = DEFAULT_SCHEMA_ROOT
      @options = DEFAULT_OPTIONS
    end
  end
end
