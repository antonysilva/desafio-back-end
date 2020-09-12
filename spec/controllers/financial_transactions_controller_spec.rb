require 'rails_helper'

RSpec.describe FinancialTransactionsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'Without authenticated user' do
      it 'redirects user to sign_in' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'With authenticated user' do
      before { sign_in user }

      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        get :index
        assert_template 'financial_transactions/index'
      end
    end
  end

end