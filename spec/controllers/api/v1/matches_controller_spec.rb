require 'rails_helper'

RSpec.describe Api::V1::MatchesController, type: :controller do

  describe "POST api_v1_matches" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirm
      sign_in user
    end

    let(:params) do
      { matches: { player_hand: "rock" } }
    end
    let(:body) { JSON.parse(response.body) }

    it "should respond with 200" do
      post :create, params: params

      expect(response.code).to eq("200")
      expect(body["opponent_hand"]).not_to eq("")
      expect(body["game_status"]).not_to eq("pending")
    end

    it "should respond with 422" do
      post :create, params: {}

      expect(response.code).to eq("422")
      expect(body["status_code"]).to eq(422)
      expect(body["status_message"]).to eq("Unprocessable Entity")
    end
  end
end
