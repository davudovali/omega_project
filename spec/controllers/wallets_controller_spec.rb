
require 'spec_helper'
require 'rails_helper'

describe WalletsController do
  context "when user not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end 
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:wallet, user: user)}
    
    before do
      sign_in user
    end  

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end
      
      it "assigns the requested wallets to subject" do
        get :index
        expect(assigns(:wallets)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested wallet to subject" do
        get :show, id: subject
        expect(assigns(:wallet)).to eq(subject)
      end
      
      it "render the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested wallet to new wallet" do
        get :new
        expect(assigns(:wallet)).to be_new_record
      end
      
      it "render the :show view" do
        get :new
        expect(response).to render_template :new
      end
    end 

    describe "POST #create" do
      context "with valid attributes" do
        it "create new object" do
          expect{
            post :create, wallet: FactoryGirl.attributes_for(:wallet)
          }.to change(Wallet, :count).by(1)
        end

        it "redirect to index path" do
          post :create, wallet: FactoryGirl.attributes_for(:wallet)
          expect(response).to redirect_to wallets_path
        end
      end
    end

   describe "GET #edit" do
      it "assigns the requested wallet to wallet" do
        get :edit, id: subject
        expect(assigns(:wallet)).to eq(subject)
      end
      
      it "render the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end  

   describe "PATCH #update" do
      context "with valid attributes" do
        it "update object" do  
          expect{        
            patch :update, id: subject, wallet: { name: 'sbercard visa', summ: 5000, currency: 'RUB'}
          }.to change{ subject.reload.name }.to('sbercard visa')
        end

        it "redirect to index path" do
          patch :update, id: subject, wallet: { name: 'sbercard visa', summ: 5000, currency: 'RUB'}
          expect(response).to redirect_to wallet_path
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @wallet = FactoryGirl.create :wallet, user: user }
      it "delete the wallet" do
        expect {
          delete :destroy, id: @wallet
        }.to change(Wallet, :count).by(-1)
      end
        
      it "redirect to index path" do
        delete :destroy, id: @wallet
        expect(response).to redirect_to wallets_path
      end
    end

  end
end


