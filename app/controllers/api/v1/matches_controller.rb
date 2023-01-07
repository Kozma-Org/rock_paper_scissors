# frozen_string_literal: true

module Api
  module V1
    class MatchesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        match = Match.create!(user: current_user, player_hand: matches_params[:player_hand])
        render json: { opponent_hand: match.opponent_hand,
                       game_status: match.game_status }
      rescue StandardError
        render json: { status_code: 422, status_message: 'Unprocessable Entity' }, status: 422
      end

      private

      def matches_params
        params.require(:matches).permit(:player_hand)
      end
    end
  end
end
