class UploadsController < ApplicationController
    def new
    end

    def create
        data_parsed = Parse::Files::ParseFile.new(purchase_params[:file], Parse::Models::CnabModel.get).parse if purchase_params[:file]
        FinancialTransactionService::Create.new(data_parsed).execute
    end

    private 
    def purchase_params
        params.permit(:file)
    end
end
