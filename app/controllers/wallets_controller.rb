class WalletsController < ApplicationController
  
  def index
    @wallets = current_user.wallets
  end

  def new
  	@wallet = Wallet.new  	
  end
    
  def create
    params.permit!
    @wallet = current_user.wallets.create(params[:wallet])
    if @wallet.errors.empty?
      redirect_to wallets_path
    else
      render "new"  
    end
  end

  def edit
  	@wallet = Wallet.find(params[:id])
  end

  def update
    params.permit!
    @wallet = Wallet.find(params[:id])
    @wallet.update_attributes(params[:wallet])
    if @wallet.errors.empty?
      redirect_to @wallet
    else
      render "edit"
    end
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy
    redirect_to wallets_path
  end

  def show
    @wallet = Wallet.find(params[:id])
  end
end
