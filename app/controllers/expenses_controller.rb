class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    params.permit!
    @expense = Expense.create(params[:expense])
      if @expense.errors.empty?
        redirect_to @expense
      else
        render "new"  
      end
  end
end
