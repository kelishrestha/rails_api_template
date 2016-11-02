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
end
