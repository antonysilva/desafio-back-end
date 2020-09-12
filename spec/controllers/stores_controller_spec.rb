require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    let!(:store) { create(:store) }
    
    context 'Without authenticated user' do
      it 'redirects user to sign_in' do
        get :show, params: {id: store.id}
        expect(response).to redirect_to(new_user_session_path)
      end

      context 'With authenticated user' do
        before { sign_in user }
  
        it 'responds successfully' do
          expect(response).to be_successful
        end
  
        it 'renders the new template' do
          get :show, params: {id: store.id}
          assert_template 'stores/show'
        end
      end
    end
  
  end
end