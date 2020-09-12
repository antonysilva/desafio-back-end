require 'rails_helper'

RSpec.describe FinancialTransactionService::Create do
    describe "Execute save data" do

        context "Should not save empty file" do 
            subject do
                create(:transaction_type)
                parsed_file = Parse::Files::ParseFile.new(File.new(Rails.root.join('spec/assets/files/BLANK_CNAB.txt')), Parse::Models::CnabModel.get).parse
                described_class.new(parsed_file).execute
            end

            it "not save data" do
                expect{ subject }.not_to change(FinancialTransaction, :count)
                expect{ subject }.not_to change(Store, :count)
            end
        end
        
        context "Should save file not error" do 
            subject do
                create(:transaction_type)
                parsed_file = Parse::Files::ParseFile.new(File.new(Rails.root.join('spec/assets/files/CNAB.txt')), Parse::Models::CnabModel.get).parse
                described_class.new(parsed_file).execute
            end

            it "should save data" do
                expect{ subject }.to change(FinancialTransaction, :count)
            end
        end
    
    end
end