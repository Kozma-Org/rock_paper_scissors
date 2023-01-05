class Match < ApplicationRecord

  # CONSTANTS

  HANDS = ["rock", "paper", "scissors"].freeze

  # ENUMS

  enum :status, { pending: 0, won: 1, lost: 2, tie: 3 }

  # VALIDATIONS

  validates_presence_of :player_hand, :oponent_hand
  validates :player_hand, :oponent_hand, inclusion: { in: HANDS }
  validates :status, presence: true, inclusion: { in: statuses.keys }

  # ASSOCIATIONS

  belongs_to :user

  # HOOKS

  before_create :set_opponent_hand, if: -> { oponent_hand.blank? }

  # INSTANCE METHODS

  private

  def set_opponent_hand
    response = RockPaperScissors::Client.throw
    self.oponent_hand = if response[:success]
                          response[:body]
                        else
                          HANDS.sample
                        end
  end
end
