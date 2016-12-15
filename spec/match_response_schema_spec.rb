require 'spec_helper'

describe 'JSON response' do
  it 'valid JSON response match schema' do
    response = [{id: 1, name: 'test'}, {id: 2, name: 'test1'}, {id: 3, name: 'test2'}].to_json

    expect(response).to match_response_schema('index')
  end

  it 'invalid response do not pass validation' do
    response = [1, 2, 3, 4].to_json

    expect(response).not_to match_response_schema('index')
  end


  it 'response with additional properties do not pass validation' do
    response = [{id: 1, name: 'test', surname: 'example'},
                {id: 2, name: 'test1', surname: 'example1'},
                {id: 3, name: 'test2', surname: 'example2'}].to_json

    expect(response).not_to match_response_schema('index')
  end

  it 'response with missing fields do not pass validation' do
    response = [{name: 'test'}, {name: 'test1'}, {name: 'test2'}].to_json

    expect(response).not_to match_response_schema('index')
  end
end
