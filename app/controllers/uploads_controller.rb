class UploadsController < ApplicationController
    def create
        if purchase_params[:file].present?
            data_parsed = Parse::Files::ParseFile.new(purchase_params[:file], Parse::Models::CnabModel.get).parse if purchase_params[:file]
            count = FinancialTransactionService::Create.new(data_parsed).execute
        end
        
        redirect_to financial_transactions_path, notice: "#{count} financial transaction has been imported."
    end

    private 
    def purchase_params
        params.permit(:file)
    end
end
