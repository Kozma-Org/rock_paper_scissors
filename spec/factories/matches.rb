FactoryBot.define do
  factory :match do
    association :user
    player_hand { "rock" }
  end

  factory :won_match, class: "Match" do
    association :user
    player_hand { "rock" }
    opponent_hand { "scissors" }
    status { "won" }
  end

  factory :lost_match, class: "Match" do
    association :user
    player_hand { "rock" }
    opponent_hand { "paper" }
    status { "lost" }
  end
end
