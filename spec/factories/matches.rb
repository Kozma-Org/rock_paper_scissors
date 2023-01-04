FactoryBot.define do
  factory :won_match, class: "Match" do
    association :user
    player_hand { "rock" }
    oponent_hand { "scissors" }
    status { "won" }
  end

  factory :lost_match, class: "Match" do
    association :user
    player_hand { "rock" }
    oponent_hand { "paper" }
    status { lost }
  end
end
