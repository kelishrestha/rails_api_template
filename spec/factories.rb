# frozen_string_literal: true
FactoryGirl.define do
  factory :api_key do
    app_info { { app_name: 'rails_api_template' } }
    token Faker::Code.asin
  end
end
