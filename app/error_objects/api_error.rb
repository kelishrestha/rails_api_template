# frozen_string_literal: true
# API error wrapper
class APIError < StandardError
  attr_accessor :code, :message

  def initialize(code, msg = nil, _request = nil, _exception = nil)
    @code = code
    @message = if msg.present?
                 msg.is_a?(Hash) ? msg : { message: msg }
               else
                 ERRORS[code]
               end
    super(message)
  end

  def render_json
    {
      json: message,
      status: code
    }
  end

  ERRORS = {
    400 => {
      message: 'Problem parsing the body'
    },
    401 => {
      message: 'Unauthorized. Invalid API token'
    },
    404 => {
      message: 'Not Found'
    },
    422 => {
      message: 'Unprocessable entity' # more customized message may override this
    },
    500 => {
      message: 'Internal server error'
    }
  }.freeze
end

class ServiceResponseError < StandardError
end
