require 'rails_helper'

RSpec.describe StoreController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    context 'Without authenticated user' do
      it 'redirects user to sign_in' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  
  end
end