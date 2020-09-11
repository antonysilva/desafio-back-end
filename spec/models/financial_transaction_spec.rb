require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  subject { FactoryBot.build(:financial_transaction) }

  describe 'Relationships' do
    it { is_expected.to belong_to(:transaction_type) }
    it { is_expected.to belong_to(:store) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :transaction_date }
    it { is_expected.to validate_presence_of :transaction_time }
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :social_security }
    it { is_expected.to validate_presence_of :card_number }
  end

  it 'Validate transaction date is present' do
    subject.transaction_date = nil
    expect(subject).to_not be_valid
  end

  it 'Validate transaction time is present' do
    subject.transaction_time = nil
    expect(subject).to_not be_valid
  end

  it 'Validate amount is present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Validate social security is present' do
    subject.social_security = nil
    expect(subject).to_not be_valid
  end

  it 'Validate card number is present' do
    subject.card_number = nil
    expect(subject).to_not be_valid
  end

  it 'Validate card number is present' do
    subject.card_number = nil
    expect(subject).to_not be_valid
  end

  it 'Ammount should return money' do
    subject.amount = 267550
    expect(subject.amount).to eq('2675,50'.to_d)
  end

  
end
