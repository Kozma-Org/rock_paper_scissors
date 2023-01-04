require 'rails_helper'

RSpec.describe User, type: :model do
  describe "VALIDATIONS" do
    it { is_expected.to validate_presence_of :nickname }
  end
end
