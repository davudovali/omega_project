class WalletsController < ApplicationController
  
  def index
    @wallets = Wallet.all
  end

  def edit
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def new
    @wallet = Wallet.new
  end
end