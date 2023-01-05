class Api::V1::MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    match = Match.create!(user: current_user, player_hand: matches_params[:player_hand])
    render json: { opponent_hand: match.opponent_hand, game_status: match.status }
  rescue
    render json: { status_code: 422, status_message: "Unprocessable Entity" }, status: 422
  end

  private

  def matches_params
    params.require(:matches).permit(:player_hand)
  end

end