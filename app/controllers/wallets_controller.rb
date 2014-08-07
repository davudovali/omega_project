class WalletsController < ApplicationController
<<<<<<< HEAD
  before_action :find_wallet, only: [:show, :edit, :update, :destroy]

  def index
    @wallets = current_user.wallets
=======
  before_action :find_user

  def index
    @wallets = @user.wallets
>>>>>>> dev_vk26
  end

  def new
  	@wallet = Wallet.new  	
  end
    
  def create
    params.permit!
<<<<<<< HEAD
    @wallet = current_user.wallets.create(params[:wallet])
=======
    @wallet = @user.wallets.create(params[:wallet])
>>>>>>> dev_vk26
    if @wallet.errors.empty?
      redirect_to user_wallets_path
    else
      render "new"  
    end
  end

  def edit
  end

  def update
    params.permit!
<<<<<<< HEAD
=======
    @wallet = @user.wallets.find(params[:id])
>>>>>>> dev_vk26
    @wallet.update_attributes(params[:wallet])
    if @wallet.errors.empty?
      redirect_to user_wallets_path
    else
      render "edit"
    end
  end

  def destroy
    @wallet.destroy

    redirect_to user_wallets_path
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  private

<<<<<<< HEAD
  def find_wallet
    @wallet = Wallet.find(params[:id])    
  end
=======
  def find_user
    if params[:user_id].nil?
      redirect_to '/users/sign_in', notice: 'You need to sign in!'       
    else
      @user = User.find(params[:user_id])  
    end
  end

>>>>>>> dev_vk26
end
