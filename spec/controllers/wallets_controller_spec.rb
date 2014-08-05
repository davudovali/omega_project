
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
      
      it "assigns the requested wallet to subject" do
        get :index
        expect(assigns(:wallets)).to eq([subject])
      end
    end
  end
end


