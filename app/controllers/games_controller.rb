# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def play; end
end
