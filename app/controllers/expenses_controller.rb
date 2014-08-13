class ExpensesController < ApplicationController
  before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new    
  end
    
  def create
    params.permit!
    @expense = current_user.expenses.create(params[:expense])
    if @expense.errors.empty?
      redirect_to expenses_path
    else
      render "new"  
    end
  end

  def edit
  end

  def update
    params.permit!
    @expense.update_attributes(params[:expense])
    if @expense.errors.empty?
      redirect_to expense_path
    else
      render "edit"
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path
  end

  def show
    @expense = Expense.find(params[:id])
  end


  private

  def find_expense
    @expense = Expense.find(params[:id])    
  end
  
end
