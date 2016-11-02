# frozen_string_literal: true
# ================= Schema Information ===================
#
# Table name: api_keys
#
#  id       :integer          not null, primary key
#  app_info :jsonb            not null
#  token    :string           not null

# Api Key model
class ApiKey < ApplicationRecord
  before_create -> { assign_unique_id(field: :token) }

  def self.valid_token?(token)
    ApiKey.exists?(token: token)
  end
end
