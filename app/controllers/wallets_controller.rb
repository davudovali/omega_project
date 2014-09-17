class WalletsController < ApplicationController

  before_action :find_wallet, only: [:show, :edit, :update, :destroy]

  def index
    @wallets = current_user.wallets
    @wallets.each {|i| i.update_summ}
  end

  def new
    @wallet = Wallet.new    
  end
    
  def create
    params.permit!
    if current_user.wallets.create(params[:wallet])
      redirect_to wallets_path
    else
      render "new"  
    end
  end

  def edit
  end

  def update
    params.permit!
    if @wallet.update_attributes(params[:wallet])
      redirect_to wallet_path
    else
      render "edit"
    end
  end

  def destroy
    @wallet.destroy
    redirect_to wallets_path
  end

  def show
  end


  private

  def find_wallet
    @wallet = Wallet.find(params[:id])    
  end

end
