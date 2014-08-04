class TransactionsController < ApplicationController
  
  def index 
    @transactions = Transaction.paginate(per_page: 10, page: params[:page])
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
    @transaction = Transaction.find(params[:id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end
  
  def update
    params.permit!
    @transaction = Transaction.find(params[:id])
    @transaction.update_attributes(params[:transaction])
      if @transaction.errors.empty?
        redirect_to @transaction
      else
        render "edit"
      end
    end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path
  end

end
