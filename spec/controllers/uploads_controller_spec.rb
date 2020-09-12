require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'Without authenticated user' do
      it 'redirects user to sign_in' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end

      context 'With authenticated user' do
        before { sign_in user }
  
        it 'responds successfully' do
          expect(response).to be_successful
        end
  
      end
    end
  end

  describe "Uploads Request" do
    before { sign_in user }
    let!(:transaction_type) { create(:transaction_type) }

    subject do
      post :create, :params => { 
        file: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/assets/files/CNAB.txt'))
      }
    end

    it "#Saved File" do
      expect{subject}.to change(FinancialTransaction, :count)
    end

  end

end