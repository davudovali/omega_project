class WalletsController < ApplicationController
  before_action :find_user

  def index
    @wallets = @user.wallets
  end

  def new
  	@wallet = Wallet.new  	
  end
    
  def create
    params.permit!
    @wallet = @user.wallets.create(params[:wallet])
    if @wallet.errors.empty?
      redirect_to user_wallets_path
    else
      render "new"  
    end
  end

  def edit
  	@wallet = Wallet.find(params[:id])
  end

  def update
    params.permit!
    @wallet = @user.wallets.find(params[:id])
    @wallet.update_attributes(params[:wallet])
    if @wallet.errors.empty?
      redirect_to user_wallets_path
    else
      render "edit"
    end
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy

    redirect_to user_wallets_path
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  private

  def find_user
    if params[:user_id].nil?
      redirect_to '/users/sign_in', notice: 'You need to sign in!'       
    else
      @user = User.find(params[:user_id])  
    end
  end

end
