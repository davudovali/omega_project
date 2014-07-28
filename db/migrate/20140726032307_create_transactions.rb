class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :wallet
      t.belongs_to :expense
      t.decimal :summ
      t.string :goal
      t.date :date
      t.string :type_of_transaction
      t.string :currency
      t.timestamps
    end
  end
end
