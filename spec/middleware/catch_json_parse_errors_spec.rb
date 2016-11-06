# frozen_string_literal: true
require 'rails_helper'

describe CatchJsonParseErrors do
  subject(:catch_json_errors) do
    request.post('/', input: post_data, 'CONTENT_TYPE' => 'application/json')
  end

  let(:app) { proc { [200, {}, ['Hello, world.']] } }
  let(:stack) { described_class.new(app) }
  let(:request) { Rack::MockRequest.new(stack) }

  context 'when invalid JSON request body' do
    let(:post_data) do
      '{
        "name": "Project",
        "description": "Used to keep track of all elements in the project
      }'
    end

    include_examples 'Validate Response Body', 'returns problem parsing body message' do
      let(:response_body) do
        { message: 'Problem parsing the body' }
      end
    end

    include_examples 'Validate Status Code', 400
  end

  context 'when valid JSON request body' do
    let(:post_data) do
      '{
        "name": "Project",
        "description": "Used to keep track of all elements in the project"
      }'
    end

    context 'continues to next app stack' do
      include_examples 'Validate Status Code', 200

      it 'returns default message' do
        expect(catch_json_errors.body).to eq('Hello, world.')
      end
    end
  end
end
