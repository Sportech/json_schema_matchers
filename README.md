# JsonSchemaMatchers

Rspec matcher for validation JSON responses using [json-schema](https://github.com/ruby-json-schema/json-schema) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'json_schema_matchers', '~> 0.0.1', git: 'git@github.com:Sportech/json_schema_matchers.git'
end
```

And then execute:

    $ bundle

## Usage

Include in `spec_helper.rb` file

```ruby
require 'json_schema_matchers/rspec'
```

Define [JSON Schema](http://json-schema.org/)

```json
# spec/json_schemas/play_preferences/show.json

{
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "id": { "type": "integer" },
      "name": { "type": "string" },
      "numbers_offered": { "type": "integer" },
      "legacy": { "type": "boolean" },
      "cutoff_time_in_minutes": { "type": "integer" },
      "selections_offered": {
        "type": "array",
        "items": { "type": "integer" }
      },
      "unique_selections": { "type": "boolean" },
      "selection_type": { "type": "string"},
      "category": { "type": "string" },
      "balance_checker_per_competition?": { "type": "boolean" },
      "created_at": {
        "type": "string",
        "format": "date-time"
      },
      "updated_at": {
        "type": "string",
        "format": "date-time"
      }
    }
  },
  "required": [
    "id",
    "name",
    "numbers_offered",
    "legacy",
    "cutoff_time_in_minutes",
    "selections_offered",
    "unique_selections",
    "selection_type",
    "category",
    "balance_checker_per_competition?"
  ],
  "additionalProperties": false
}
```

Then, validate `response` against your schema with `match_response_schema`

```ruby
# spec/contract/example_spec.rb

it {
  get '/product'

  expect(last_response.status).to eq(200)
  expect(last_response.body).to match_response_schema('products/index')
}
```

## Configuration

Default `schema_root` is `"#{Dir.pwd}/spec/json_schemas"`

Default custom options

```
version:         :draft4
insert_defaults: true
validate_schema: true
```

Options can be added or overrided usning `JsonSchemaMatchers.configure`

```ruby
JsonSchemaMatchers.configure do |config|
  config.schema_root = "#{Rails.root}/spec/fixtures/json_schemas"
  config.options[:strict] = true
end
```

More options can be found [here](https://github.com/ruby-json-schema/json-schema/tree/v2.7.0#advanced-options)
