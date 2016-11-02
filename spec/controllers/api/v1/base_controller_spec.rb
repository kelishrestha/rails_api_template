# frozen_string_literal: true
require 'rails_helper'

describe Api::V1::BaseController, type: :api do
  describe '#status' do
    subject { get 'api/v1/status' }

    let(:api_key) { FactoryGirl.create(:api_key) }

    before do
      header 'x-api-token', api_key.token
      header 'Content-type', 'application/json'
    end

    include_examples 'Validate Response Body', 'returns success message' do
      let(:response_body) do
        { message: 'App is up and running' }
      end
    end
  end
end
