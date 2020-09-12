require 'rails_helper'

RSpec.describe Utils::NumberUtil do
  subject do
    described_class.new("1250").integer_to_money
  end

  describe "Parse number" do
    it "Integer to money" do
      expect(subject).to eq(12.50)
    end
  end
end