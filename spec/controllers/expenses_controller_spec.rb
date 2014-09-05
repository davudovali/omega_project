require 'spec_helper'
require 'rails_helper'

RSpec.describe ExpensesController, :type => :controller do
  context "when user log out" do
    describe "GET index" do
      it "redirect to log in page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when user log in" do
    let(:user) {FactoryGirl.create(:user)}
    subject {FactoryGirl.create(:expense, user: user)}

    before do
      sign_in user
    end
     describe "GET #show" do
      it "assigns the requested expense to subject" do
        get :show, id: subject
        expect(assigns(:expense)).to eq(subject)
      end
      
      it "render the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested expense to new expense" do
        get :new
        expect(assigns(:expense)).to be_new_record
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
            post :create, expense: FactoryGirl.attributes_for(:expense)
          }.to change(Expense, :count).by(1)
        end

        it "redirect to index path" do
          post :create, expense: FactoryGirl.attributes_for(:expense)
          expect(response).to redirect_to expenses_path
        end
      end
    end

   describe "GET #edit" do
      it "assigns the requested expense to expense" do
        get :edit, id: subject
        expect(assigns(:expense)).to eq(subject)
      end
      
      it "render the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end  

    describe "DELETE #destroy" do
      before(:each) { @expense= FactoryGirl.create :expense, user: user }
      it "delete the expense" do
        expect {
          delete :destroy, id: @expense
        }.to change(Expense, :count).by(-1)
      end
        
      it "redirect to index path" do
        delete :destroy, id: @expense
        expect(response).to redirect_to expenses_path
      end
    end
  end
end
