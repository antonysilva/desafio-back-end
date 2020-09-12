class FinancialTransactionsController < ApplicationController
    
    def index
        @financial_transactions = FinancialTransaction.all
    end

end
