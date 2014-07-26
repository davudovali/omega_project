class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps
    end
  end
end
