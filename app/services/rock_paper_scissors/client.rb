# frozen_string_literal: true

require 'net/http'

module RockPaperScissors
  class Client
    API_URL = ENV['PRODUCTION_URL']
    # API_URL = ENV['MOCK_SERVER_URL']
    MAX_TRY = 3

    class << self
      def throw
        tries = 0
        begin
          Rails.logger.info("GET #{API_URL}")
          response = Net::HTTP.get_response(URI(API_URL))
          response_handler(response)
        rescue StandardError => e
          Rails.logger.debug(e)
          tries += 1
          if tries <= MAX_TRY
            Rails.logger.info("Retrying #{tries}. time(s)")
            retry
          else
            Rails.logger.info("Retry limit has been reached: #{MAX_TRY}")
          end
          { status_code: 500, status_message: 'Something went wrong.', success: false }
        end
      end

      def response_handler(response)
        body = JSON.parse(response.body).with_indifferent_access
        case response.code
        when '200'
          body.merge!(success: true)
        else
          { status_code: response.code.to_i, status_message: body['message'], success: false }
        end
      end
    end
  end
end
