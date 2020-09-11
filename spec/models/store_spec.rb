require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { FactoryBot.build(:store) }

  describe 'Relationships' do
    it { is_expected.to have_many :financial_transactions }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :owner }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:owner).ignoring_case_sensitivity }
  end

  it 'Validate name is present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Validate owner is present' do
    subject.owner = nil
    expect(subject).to_not be_valid
  end
end
