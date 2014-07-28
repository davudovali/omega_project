class Expense < ActiveRecord::Base
	has_many :transactions, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: {in: 1..40}, uniqueness: true
end
