class UploadsController < ApplicationController
    def index
        @purchases = []
    end

    def new
    end

    def create
        data = Parse::Files::ParseFile.new(purchase_params[:file], Parse::Models::CnabModel.get).parse if purchase_params[:file]
        p data
    end

    private 
    def purchase_params
        params.permit(:file)
    end
end
