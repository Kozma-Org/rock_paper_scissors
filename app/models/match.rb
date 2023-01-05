class Match < ApplicationRecord

  # CONSTANTS

  HANDS = ["rock", "paper", "scissors"].freeze
  RULES = {
    "rock" => "scissors",
    "paper" =>  "rock",
    "scissors" => "paper"
  }.freeze

  # ENUMS

  enum :status, { pending: 0, won: 1, lost: 2, tie: 3 }

  # VALIDATIONS

  validates_presence_of :player_hand, :opponent_hand
  validates :player_hand, :opponent_hand, inclusion: { in: HANDS }
  validates :status, presence: true, inclusion: { in: statuses.keys }

  # ASSOCIATIONS

  belongs_to :user

  # HOOKS

  before_validation :set_opponent_hand, on: :create
  before_validation :set_status,        on: :create

  # INSTANCE METHODS

  private

  def set_opponent_hand
    response = RockPaperScissors::Client.throw
    self.opponent_hand = if response[:success]
                           response[:body]
                         else
                           HANDS.sample
                         end
  end

  def set_status
    self.status = if RULES[player_hand] == opponent_hand
                    "won"
                  elsif player_hand == opponent_hand
                    "tie"
                  else
                    "lost"
                  end
  end
end
