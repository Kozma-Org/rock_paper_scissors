# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'ATTRIBUTES' do
    it { is_expected.to have_attribute :user_id }
    it { is_expected.to have_attribute :player_hand }
    it { is_expected.to have_attribute :opponent_hand }
    it { is_expected.to have_attribute :status }
  end

  describe 'VALIDATIONS' do
    it { is_expected.to validate_presence_of :player_hand }
    it { is_expected.to validate_inclusion_of(:player_hand).in_array(Match::HANDS) }
    xit { is_expected.to validate_presence_of(:opponent_hand) }
    xit { is_expected.to validate_inclusion_of(:opponent_hand).in_array(Match::HANDS) }
    xit { is_expected.to validate_presence_of :status }
  end

  describe 'ASSOCIATIONS' do
    it { is_expected.to belong_to(:user) }
  end
end
