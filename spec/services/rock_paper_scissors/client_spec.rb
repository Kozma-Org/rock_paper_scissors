# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RockPaperScissors::Client, type: :service do
  describe 'CLASS METHODS' do
    describe '.response_handler' do
      let(:response_class) { Struct.new(:code, :body) }

      context 'when the response status is 200 OK' do
        let(:body)     { '{"statusCode":200,"body":"rock","success":true}' }
        let(:response) { response_class.new('200', body) }
        let(:expected_response) { JSON.parse(body) }

        it 'returns with the response body' do
          expect(described_class.response_handler(response)).to eq(expected_response)
        end
      end

      context 'when the response status is 500 Internal Server Errror' do
        let(:body)     { '{"status_code":500,"message":"Internal server error","success":false}' }
        let(:response) { response_class.new('500', body) }
        let(:expected_error) { { status_code: 500, status_message: 'Internal server error', success: false } }

        it 'returns with error' do
          expect(described_class.response_handler(response)).to eq(expected_error)
        end
      end
    end

    describe '.throw' do
      context 'when any error raises' do
        let(:expected_error) { { status_code: 500, status_message: 'Something went wrong.', success: false } }

        before do
          allow(Net::HTTP).to receive(:get_response).and_raise('!!!BOOM!!!')
        end

        it 'returns with 500 Internal Server Error' do
          expect(described_class.throw).to eq(expected_error)
        end
      end
    end
  end
end
