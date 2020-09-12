require 'rails_helper'

RSpec.describe Parse::Files::ParseFile do
   
    describe "Parse file" do

        context "If file is empty?" do 
            subject do
                described_class.new(File.new(Rails.root.join('spec/assets/files/CNAB-blank.txt')), Parse::Models::CnabModel.get).parse
            end

            it 'Array should came empty' do
                expect{ subject.count }.to be_empty
            end
        end

        context "If file is not empty?" do 
            subject do
                described_class.new(File.new(Rails.root.join('spec/assets/files/CNAB.txt')), Parse::Models::CnabModel.get).parse
            end

            it 'Array should note came empty' do
                expect{ subject.count }.not_to be_empty
                expect{ subject.count }.to eq(1)
            end
        end
    
    end

end
