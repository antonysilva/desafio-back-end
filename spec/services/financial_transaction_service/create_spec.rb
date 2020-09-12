require 'rails_helper'

RSpec.describe FinancialTransactionService::Create do
    describe "Execute save data" do

        context "Should not save empty file" do 
            subject do
                ::TransactionType.create([
                    {id: 1, name: "Débito", signal: "+"},
                    {id: 2, name: "Boleto", signal: "-"},
                    {id: 3, name: "Financiamento", signal: "-"},
                    {id: 4, name: "Crédito", signal: "+"},
                    {id: 5, name: "Recebimento Empréstimo", signal: "+"},
                    {id: 6, name: "Vendas", signal: "+"},
                    {id: 7, name: "Recebimento TED", signal: "+"},
                    {id: 8, name: "Recebimento DOC", signal: "+"},
                    {id: 9, name: "Aluguel", signal: "-"}
                ]) 

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
                ::TransactionType.create([
                    {id: 1, name: "Débito", signal: "+"},
                    {id: 2, name: "Boleto", signal: "-"},
                    {id: 3, name: "Financiamento", signal: "-"},
                    {id: 4, name: "Crédito", signal: "+"},
                    {id: 5, name: "Recebimento Empréstimo", signal: "+"},
                    {id: 6, name: "Vendas", signal: "+"},
                    {id: 7, name: "Recebimento TED", signal: "+"},
                    {id: 8, name: "Recebimento DOC", signal: "+"},
                    {id: 9, name: "Aluguel", signal: "-"}
                ]) 

                parsed_file = Parse::Files::ParseFile.new(File.new(Rails.root.join('spec/assets/files/CNAB.txt')), Parse::Models::CnabModel.get).parse
                described_class.new(parsed_file).execute
            end

            it "should save data" do
                expect{ subject }.to change(FinancialTransaction, :count)
            end
        end
    
    end
end