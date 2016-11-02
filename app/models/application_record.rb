# frozen_string_literal: true
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Include uid generation
  include RandomAlphaNumeric
end
