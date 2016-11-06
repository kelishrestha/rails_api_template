# frozen_string_literal: true
require 'rails_helper'
describe ApiKey do
  describe '.valid_token?' do
    subject { described_class.valid_token?(token) }

    let(:token) { Faker::Code.asin }

    context 'when api token is not found' do
      it { is_expected.to be false }
    end

    context 'when api token is found' do
      before { FactoryGirl.create(:api_key, token: token) }

      it { is_expected.to be true }
    end
  end
end
