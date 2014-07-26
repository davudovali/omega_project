class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.belongs_to :user
      t.decimal :summ
      t.string :currency

      t.timestamps
    end
  end
end
