class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :wallet 
      t.belongs_to :wallet_transaction 

      t.timestamps
    end
  end
end
