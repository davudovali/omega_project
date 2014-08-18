class WalletsController < ApplicationController

  before_action :find_wallet, only: [:show, :edit, :update, :destroy]
  before_action :update_wallet_value

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
  end

  def update
    params.permit!
    @wallet.update_attributes(params[:wallet])
    if @wallet.errors.empty?
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
    @wallet = Wallet.find(params[:id])
  end

  private

  def find_wallet
    @wallet = Wallet.find(params[:id])    
  end

  def update_wallet_value
    current_user.wallets.each do |i|
      i.summ = i.transactions.inject(0) {|sum, i| sum + i.summ }
    end
  end

end
