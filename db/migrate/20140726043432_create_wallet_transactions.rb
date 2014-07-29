class CreateWalletTransactions < ActiveRecord::Migration
  def change
    create_table :wallet_transactions do |t|
      t.decimal :summ
      t.date :date
      t.timestamps
    end
  end
end
