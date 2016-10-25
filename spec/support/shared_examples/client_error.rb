# frozen_string_literal: true

# 422 Unproccessable entity
RSpec.shared_examples 'Validation Failure' do
  let(:subject_status) { subject.status }
  let(:parsed_body) { subject.parsed_body }
  let(:error_message) { 'Validation Failed' }
  let(:errors) { [] }

  it 'responds with 422 code' do
    expect(subject_status).to eq(422)
  end

  it 'responds with validation failed error message' do
    expect(parsed_body['message']).to eq(error_message)
  end

  it 'responds with fieldwise error message block' do
    expect(parsed_body['errors']).to eq(errors.map(&:with_indifferent_access))
  end
end

# 400 Error
RSpec.shared_examples 'Resource not found' do |resource|
  let(:error_message) { '' }
  let(:subject_status) { subject.status }
  let(:parsed_body) { subject.parsed_body }

  it 'responds with 404 code' do
    expect(subject_status).to eq(404)
  end

  it "responds with #{resource} not found error" do
    expect(parsed_body['message']).to eq(error_message)
  end
end
