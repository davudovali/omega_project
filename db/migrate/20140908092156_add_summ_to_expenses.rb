class AddSummToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :summ, :decimal
  end
end
