class UploadsController < ApplicationController
    def create
        if purchase_params[:file].present?
            data_parsed = Parse::Files::ParseFile.new(purchase_params[:file], Parse::Models::CnabModel.get).parse if purchase_params[:file]
            FinancialTransactionService::Create.new(data_parsed).execute
        end
        redirect_to financial_transactions_path
    end

    private 
    def purchase_params
        params.permit(:file)
    end
end
