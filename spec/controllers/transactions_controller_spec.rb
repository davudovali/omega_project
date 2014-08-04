=begin require 'rails_helper'

RSpec.describe TransactionsController, :type => :controller do
 
  describe "show action" do
    it "renders show template if an transaction is found" do 
      transaction = create(:transaction)
      get :show, {id: transaction.id }
      expect(response).to render_template('show')
    end
  end

  describe "edit action" do 
    it "renders show template if an transaction is found" do 
      transaction = create(:transaction)
      get :edit, {id: transaction.id }
      expect(response).to render_template('edit')
    end
  end

  
  describe "create action" do
    it "redirects to the transaction page after the transaction is created" do
      post :create, transaction: { summ: 400, goal: "TV" }
      @transaction = assigns(:transaction)
      expect(response).to redirect_to(@transaction)
    end
  end
  
  describe "new action" do 
    it "renders 'new' template if valiadtions fail after trying
      to create an transaction" do
      post :create, transaction: { summ: 100000 }
      expect(response).to render_template("new")
    end

    it "renders 'new' template if valiadtions fail after trying
      to create an transaction" do
      post :create, transaction: { goal: 'car' }
      expect(response).to render_template("new")
    end
  end
  
  describe "destroy action" do
  
    it "redirects to index action when an transaction is destroyed
    successfuly" do 
      transaction = create(:transaction)
      delete :destroy, id: transaction.id
      expect(response).to redirect_to(transactions_path) 
    end
  end

  describe "update action" do 
    it "renders edit page again" do
      post :create, transaction: {goal: "ss", summ: nil}
    end
  end
  
  describe "GET 'home'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end  
end 
=end 
