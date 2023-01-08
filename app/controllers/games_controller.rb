# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def play; end

  def statistics
    matches = current_user.matches
    @user_rps_stat = matches.group(:player_hand).count.with_indifferent_access
    @curb_rps_stat = matches.group(:opponent_hand).count.with_indifferent_access
    @user_stat = matches.group(:status).count.with_indifferent_access
  end
end
