class Wallet < ActiveRecord::Base
	belongs_to :user
	has_many :transactions
	has_many :appointments
	has_many :wallet_transactions, :through => :appointments
	validates :name, length: {in: 3..16}, uniqueness: true
	validates :summ, numericality: true
  validates :currency, format: {with: /(USD|RUB|EUR|GBP)/}
end
