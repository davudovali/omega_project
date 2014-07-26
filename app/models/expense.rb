class Expense < ActiveRecord::Base
	has_many :transactions
  validates :name, presence: true, length: {in: 3..40}, uniqueness: true
end
