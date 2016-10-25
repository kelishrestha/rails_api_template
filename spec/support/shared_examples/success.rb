# frozen_string_literal: true

# 201 Created Successfully
RSpec.shared_examples 'Successfully Created' do |object|
  let(:subject_body) { subject.body }
  let(:subject_status) { subject.status }
  let(:response_body) { {} }

  it 'responds with 201 code' do
    expect(subject_status).to eq(201)
  end

  it "returns created #{object} in response" do
    expect(subject_body).to eq(response_body)
  end
end

# 200 OK Resource body
RSpec.shared_examples 'Serving a Resource' do |resource|
  let(:response_body) { {} }
  let(:subject_body) { JSON.parse(subject.body) }
  let(:subject_status) { subject.status }

  it "returns the json representation of the #{resource}" do
    expect(subject_body).to eq(response_body)
  end

  it 'responds with 200 status code' do
    expect(subject_status).to eq(200)
  end
end

# 204 No content
RSpec.shared_examples 'Success with no content' do |object|
  let(:subject_body) { subject.body }
  let(:subject_status) { subject.status }
  let(:response_body) { {} }

  it 'responds with 204 code' do
    expect(subject_status).to eq(204)
  end

  it "returns no content for #{object}" do
    expect(subject_body).to eq('')
  end
end
