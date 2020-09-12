require 'rails_helper'

RSpec.describe "FinancialTransactionsController", type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/financial_transactions').to route_to('financial_transactions#index')
    end
  end

end