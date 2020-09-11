require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  subject { FactoryBot.build(:transaction_type) }

  describe 'Relationships' do
    it { should have_many :financial_transactions }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :signal }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:signal).ignoring_case_sensitivity }
  end

  it 'Validate name is present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Validate signal is present' do
    subject.signal = nil
    expect(subject).to_not be_valid
  end
end
