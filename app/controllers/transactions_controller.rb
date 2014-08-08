class TransactionsController < ApplicationController
  before_action  :find_transaction, only:[:show, :edit,:update, :destroy]
    
  def index 
    @transactions = Transaction.all.paginate(per_page: 30, page: params[:page])
    order = params[:order] == "asc" ? "asc" : "desc"
    @transactions = @transactions.order("created_at #{order}")
  end

  def new
    @transaction = Transaction.new
  end

  def create
    params.permit!
    @transaction = Transaction.create(params[:transaction])
      if @transaction.errors.empty?
        redirect_to @transaction
      else
        render "new"  
      end
  end
  
  def show

  end

  def edit

  end
  
  def update
    params.permit!
    @transaction.update_attributes(params[:transaction])
      if @transaction.errors.empty?
        redirect_to @transaction
      else
        render "edit"
      end
    end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
  end
  
private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
  
end
