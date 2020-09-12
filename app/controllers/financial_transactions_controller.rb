class FinancialTransactionsController < ApplicationController
    before_action :get_financial_transaction, only: %w(destroy)

    def index
        @financial_transactions = FinancialTransaction.all
    end

    def destroy
        raise "Data not found" if @financial_transaction.nil?
        @financial_transaction.destroy
        redirect_to financial_transactions_path
    end

    private
    def get_financial_transaction
        @financial_transaction = FinancialTransaction.find_by_id(params[:id])
    end

end
